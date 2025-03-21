unit Morph;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, System.JSON,
  Morph.EnumeratedTypes, Morph.Table, Morph.Field, Morph.Settings, Morph.Vector,
  Datasnap.DBClient, System.Rtti, System.Generics.Collections, Data.DB,
  Morph.Where, Vcl.ExtCtrls, Morph.InsertFromVisualComponents,
  Morph.SQLExecutor;

type
  TMorph = class
    private
      FTableName,
      FPSQLCommand: String;

      FFB5FieldTypeNames,
      FFB2_5FieldTypeNames: TDictionary<Integer, String>;

      FTempConnection: TFDConnection;

      FIgnoreCreatedStructure: Boolean;

                                    {Table               Field   Exists or
                                     name                name    not      }
      FTablesStructure : TDictionary<String, TDictionary<String, Boolean>>;

      FDQResult: TFDQuery;
      FStage: TMorphStages;
      FInsertTable: TMphTable;
      FSettings: TMorphSettings;
      FFieldsToProcess: TMorphFields;
      FMorphSQLExecutor: TMorphSQLExecutor;
      FDataOrientation: TMorphDateOrientation;
      FInsertFromVisualComponents: TInsertFromVisualComponents;
      FFDMTTypeToMphFieldType: TDictionary<TFieldType, TMorphFieldTypes>;
    public
      constructor Create;
      destructor Destroy; override;

      procedure Clear;
      procedure ExecutePSQL(const aCommand : String);
      procedure ReloadDBTablesAndFieldsList;

      class function New: TMorph;

      function _Or: TMorph;
      function Add: TMorph;
      function All: TMorph;
      function _And: TMorph;
      function Drop: TMorph;
      function Post: TMorph;
      function tDate: TMorph;
      function Delete: TMorph;
      function Unique: TMorph;
      function tFloat: TMorph;
      function Config: TMorph;
      function Select: TMorph;
      function NotNull: TMorph;
      function Identity: TMorph;
      function tInteger: TMorph;
      function tBoolean: TMorph;
      function AsInteger: Integer;
      function InsertInto: TMorph;
      function ForeignKey: TMorph;
      function References: TMorph;
      function PrimaryKey: TMorph;
      function tBinaryBlob: TMorph;
      function CreateTable: TMorph;
      function NoOrphanData: TMorph;
      function NullOrphanData: TMorph;
      function GetDBType : TMorphDBType;
      function DeleteOrphanData: TMorph;
      function GetPSQLTypeName: String;
      function AsTFDMemTable: TFDMemTable;
      function ExportSettings: TJSONObject;
      function GetFB5FieldTypeName: String;
      function GetFB2_5FieldTypeName: String;
      function CloneSettings: TMorphSettings;
      function IgnoreCreatedStructure: TMorph;
      function DoNotRaiseOnRedundances: TMorph;
      function AsTClientDataSet: TClientDataSet;
      function Equals<T>(const aValue: T): TMorph;
      function GetTableNames: TMorphVector<String>;
      function Field(const AField: String): TMorph;
      function Max(const AFieldName: String): TMorph;
      function Min(const AFieldName: String): TMorph;
      function FKName(const aFKName: String): TMorph;
      function From(const aTableName: String): TMorph;
      function tVarchar(const aSize: Integer): TMorph;
      function Table(const aTableName: String): TMorph;
      function OpenPSQL(const aCommand: String): TMorph;
      function CurrentPSQL(Out anOutVar: String): TMorph;
      function Where(const aWhereInstruction : W) : TMorph;
      function Values(const aValues: TArray<TValue>): TMorph;
      function AlterSegment(const aSegmentID: Integer): TMorph;
      function Fields(const aFieldNames: TArray<String>): TMorph;
      function DatabaseType(const ADBType: TMorphDBType): TMorph;
      function Settings(const ASettings: TMorphSettings): TMorph;
      function Connection(const AConnection: TFDConnection): TMorph;
      function GetBasicType(const aValue: TValue): TMorphBasicTypes;
      function AssignToInsert(const ALabeledEdit: TLabeledEdit): TMorph;
      function DateOrientation(const anOrientation: TMorphDateOrientation): TMorph;
      function FDMTableFieldTypeConvert(const aFieldType: TFieldType): TMorphFieldTypes;

      //overloaded
      function Insert: TMorph; overload;
      function Insert(const aJSONInsert : String) : TMorph; overload;
      function Insert(const aMphTable : TMphTable) : TMorph; overload;

      function Content(const aJSONStringArray : String) : TMorph; overload;
      function Content(const aFDMemtable : TFDMemTable) : TMorph; overload;
    end;
implementation

uses
  Morph.PSQL.Structure.FB5, Morph.PSQL.Structure.Common,
  System.SysUtils, Morph.DataSetUtilities, Morph.PSQL.Structure.FB2_5,
  Winapi.Windows, Morph.Messages, System.TypInfo, Morph.DataBaseUtilities;

{ TMorph }

function TMorph.Add: TMorph;
var
  vFieldCount : Integer;
  vField : TMorphField;
begin
  try
    FPSQLCommand := PSQL_FB5_ALTER_TABLE+PSQL_SPACE+FTableName;

    FFieldsToProcess.First;
    for vFieldCount := 0 to FFieldsToProcess.Count -1 do
    begin
      vField := FFieldsToProcess.Elements[vFieldCount];

      if vFieldCount > 0 then
        FPSQLCommand:=FPSQLCommand+ PSQL_COMMA;

      FPSQLCommand:=FPSQLCommand+PSQL_SPACE+PSQL_FB5_ADD+PSQL_SPACE+vField.Name+PSQL_SPACE+GetPSQLTypeName;

      if FFieldsToProcess.Current.FieldType = mphVarchar then
        FPSQLCommand:=FPSQLCommand+ PSQL_OPEN_PARENTHESES+IntToStr(FFieldsToProcess.Current.Size)+PSQL_CLOSED_PARENTHESES;

      if vField.Identity then
        FPSQLCommand:=FPSQLCommand+ PSQL_SPACE+PSQL_FB5_IDENTITY;

      if vField.PrimaryKey then
        FPSQLCommand:=FPSQLCommand+ PSQL_SPACE+PSQL_FB5_PRIMARY_KEY;

      if vField.NotNull then
        FPSQLCommand:=FPSQLCommand+ PSQL_SPACE+PSQL_FB5_NOT_NULL;

      if vField.Unique then
        FPSQLCommand:=FPSQLCommand+ PSQL_SPACE+PSQL_FB5_UNIQUE;

      if NOT FFieldsToProcess.Eof then
        FFieldsToProcess.Next;
    end;

    FPSQLCommand:=FPSQLCommand+PSQL_SEMICOLON;

    try
      ExecutePSQL(FPSQLCommand);
    finally
      FPSQLCommand := '';
    end;

  finally
    FFieldsToProcess.Clear;
    FStage := mpsCreate;
  end;
end;

function TMorph.All: TMorph;
begin
  case FSettings.DatabaseType of
    FB2_5: FPSQLCommand:=FPSQLCommand+PSQL_SPACE+ PSQL_ASTERISK;
    FB5: FPSQLCommand:=FPSQLCommand+PSQL_SPACE+ PSQL_ASTERISK;
  end;

  Result := Self;
end;

function TMorph.AlterSegment(const aSegmentID: Integer): TMorph;
begin

end;

function TMorph.AsInteger: Integer;
var
  TempFDQuery: TFDQuery;
  TempFDConnetion: TFDConnection;
begin
  TempFDQuery := TFDQuery.Create(Nil);
  TempFDConnetion := TMorphFireDacUtilities.Clone(FSettings.Connection);
  try
    TempFDQuery.Connection := TempFDConnetion;
    TempFDQuery.SQL.Text := FPSQLCommand;
    TempFDQuery.Open;

    Result := TempFDQuery.Fields[0].AsInteger;
  finally
    TempFDQuery.Free;
    TempFDConnetion.Free;
  end;
end;

function TMorph.AssignToInsert(const ALabeledEdit: TLabeledEdit): TMorph;
begin
  FInsertFromVisualComponents.AddComponent(ALabeledEdit);
  FSTage := mpsInsertFromVisualComponent;
  Result := Self;
end;

function TMorph.AsTClientDataSet: TClientDataSet;
begin
  try
    OpenPSQL(FPSQLCommand);
  finally
    FPSQLCommand := '';
  end;

  Result := TClientDataSet.Create(Nil);
  TMorphDSUtls.FDQryToClientDS(FDQResult, Result);
end;

function TMorph.AsTFDMemTable: TFDMemTable;
begin
  try
     OpenPSQL(FPSQLCommand);
  finally
    FPSQLCommand := '';
  end;

  Result := TFDMemTable.Create(Nil);
  TMorphDSUtls.FDQryToFDMemtable(FDQResult, Result);
end;

function TMorph.tBoolean: TMorph;
begin
  FFieldsToProcess.Current.FieldType := mphBoolean;
  Result := Self;
end;

function TMorph.tBinaryBlob: TMorph;
begin
  FFieldsToProcess.Current.FieldType := mphBinaryBlob;
  Result := Self;
end;

procedure TMorph.Clear;
begin

end;

function TMorph.CloneSettings: TMorphSettings;
begin
  Result := FSettings.Clone;
end;

function TMorph.Config: TMorph;
begin
  Result := Self;
end;

function TMorph.Connection(const AConnection: TFDConnection): TMorph;
begin
  FSettings.Connection(aConnection);
  FMorphSQLExecutor.Connection(AConnection);
  Result := Self;
end;

function TMorph.Content(const aFDMemtable: TFDMemTable): TMorph;
var
  LFieldsIndex, LLinesIndex : Integer;
begin
  aFDMemTable.DisableControls;
  try
    for LFieldsIndex := 0 to aFDMemTable.Fields.Count -1 do //Fields
      FInsertTable.Fields.Add(TMorphField.New.SetName(aFDMemTable.Fields[LFieldsIndex].FieldName).SetFieldType(FDMTableFieldTypeConvert(aFDMemtable.Fields[LFieldsIndex].DataType)));

    aFDMemtable.First;
    for LLinesIndex := 0 to aFDMemtable.RecordCount -1 do //Values
    begin
      for LFieldsIndex := 0 to aFDMemtable.Fields.Count -1 do //Values
      begin
        case FInsertTable.Fields.Elements[LFieldsIndex].FieldType of
          mphInteger: FInsertTable.Fields.Elements[LFieldsIndex].AddValue(aFDMemTable.Fields[LFieldsIndex].AsInteger);
          mphVarchar:FInsertTable.Fields.Elements[LFieldsIndex].AddValue(aFDMemTable.Fields[LFieldsIndex].AsString);
          mphFloat:FInsertTable.Fields.Elements[LFieldsIndex].AddValue(aFDMemTable.Fields[LFieldsIndex].AsFloat);
          mphDate:FInsertTable.Fields.Elements[LFieldsIndex].AddValue(aFDMemTable.Fields[LFieldsIndex].AsDateTime);
          mphBoolean:FInsertTable.Fields.Elements[LFieldsIndex].AddValue(aFDMemTable.Fields[LFieldsIndex].AsBoolean);
          mphTXTBlob:FInsertTable.Fields.Elements[LFieldsIndex].AddValue(aFDMemTable.Fields[LFieldsIndex].AsString);
          mphBinaryBlob:FInsertTable.Fields.Elements[LFieldsIndex].AddValue(aFDMemTable.Fields[LFieldsIndex].AsString);
        end;
      end;
      aFDMemTable.Next;
    end;

    Post;
  finally
    FStage := mpsCreate;
    aFDMemTable.EnableControls;
  end;
end;

function TMorph.Content(const aJSONStringArray : String): TMorph;
var
  InsertJSONObject, LineJSONObject : TJSONObject;
  InsertJSONArray : TJSONArray;
  TempJSONLine, TempJSONKeyValue : TJSONValue;
  JSONKeysIndex : Integer;
  TempJSONString : String;
begin
  InsertJSONArray := TJSONArray.Create;
  try
    try
      InsertJSONArray := TJSONArray(TJSONArray.ParseJSONValue(aJSONStringArray));

      if Assigned(InsertJSONArray) then
        if InsertJSONArray.Count <= 0 then
          Raise Exception.Create(MORPH_MESSAGE_EMPTY_INSERT_JSON);

      LineJSONObject := InsertJSONArray.Items[0] as TJSONObject;

      for JSONKeysIndex := 0 to LineJSONObject.Count -1 do //Keys to Fields
        FInsertTable.Fields.Add(TMorphField.New.SetName(LineJSONObject.Pairs[JSONKeysIndex].JsonString.Value));

      for TempJSONLine in InsertJSONArray do //Lines:
      begin
        LineJSONObject := TempJSONLine as TJSONObject;

        for JSONKeysIndex := 0 to LineJSONObject.Count -1 do //Values
        begin
          TempJSONKeyValue := LineJSONObject.Pairs[JSONKeysIndex].JsonValue;
           {$REGION 'Saves value in table with correct type'}
            if TempJSONKeyValue is TJSONNumber then
            begin
              if Pos('.', TempJSONKeyValue.ToString) > 0 then
              begin
                FInsertTable.Fields.Elements[JSONKeysIndex].FieldType := mphFloat;
                FInsertTable.Fields.Elements[JSONKeysIndex].AddValue(TempJSONKeyValue.AsType<Double>);
              end
              else
              begin
                FInsertTable.Fields.Elements[JSONKeysIndex].FieldType := mphFloat;
                FInsertTable.Fields.Elements[JSONKeysIndex].AddValue(TempJSONKeyValue.AsType<Integer>);
              end;
            end
            else if TempJSONKeyValue is TJSONBool then
            begin
              FInsertTable.Fields.Elements[JSONKeysIndex].FieldType := mphBoolean;
              FInsertTable.Fields.Elements[JSONKeysIndex].AddValue(TempJSONKeyValue.AsType<Boolean>);
            end
            else
            begin
              FInsertTable.Fields.Elements[JSONKeysIndex].FieldType := mphVarchar;
              TempJSONString := TempJSONKeyValue.Value;
              FInsertTable.Fields.Elements[JSONKeysIndex].AddValue(TempJSONString);
            end;
           {$ENDREGION}
        end;
      end;

    except on E : Exception do
      if E.Message = MORPH_MESSAGE_EMPTY_INSERT_JSON then
        Raise E
      else
        Raise Exception.Create(MORPH_MESSAGE_INVALID_JSON_OBJECT);
    end;

    Post;

  finally
    InsertJSONObject.Free;
  end;
end;

constructor TMorph.Create;
begin
  {$REGION 'FFB5FieldTypeNames'}
  FFB5FieldTypeNames := TDictionary<Integer, String>.Create;
  FFB5FieldTypeNames.Add(Ord(mphInteger), PSQL_FB5_TYPE_INTEGER);
  FFB5FieldTypeNames.Add(Ord(mphVarchar), PSQL_FB5_TYPE_VARCHAR);
  FFB5FieldTypeNames.Add(Ord(mphFloat), PSQL_FB5_TYPE_FLOAT);
  FFB5FieldTypeNames.Add(Ord(mphDate), PSQL_FB5_TYPE_DATE);
  FFB5FieldTypeNames.Add(Ord(mphBoolean), PSQL_FB5_TYPE_BOOLEAN);
  FFB5FieldTypeNames.Add(Ord(mphTXTBlob), PSQL_FB5_TYPE_TXTBLOB);
  FFB5FieldTypeNames.Add(Ord(mphBinaryBlob), PSQL_FB5_TYPE_BINBLOB);
  {$ENDREGION}

  {$REGION 'TFDMemtable types to TMorphField types reference'}
  FFDMTTypeToMphFieldType := TDictionary<TFieldType, TMorphFieldTypes>.Create;

  // Int
  FFDMTTypeToMphFieldType.Add(ftSmallint, mphInteger);
  FFDMTTypeToMphFieldType.Add(ftInteger, mphInteger);
  FFDMTTypeToMphFieldType.Add(ftWord, mphInteger);
  FFDMTTypeToMphFieldType.Add(ftAutoInc, mphInteger);
  FFDMTTypeToMphFieldType.Add(ftLargeint, mphInteger);
  FFDMTTypeToMphFieldType.Add(ftShortint, mphInteger);
  FFDMTTypeToMphFieldType.Add(ftByte, mphInteger);
  FFDMTTypeToMphFieldType.Add(ftLongWord, mphInteger);

  // Float/Decimal
  FFDMTTypeToMphFieldType.Add(ftFloat, mphFloat);
  FFDMTTypeToMphFieldType.Add(ftCurrency, mphFloat);
  FFDMTTypeToMphFieldType.Add(ftBCD, mphFloat);
  FFDMTTypeToMphFieldType.Add(ftFMTBcd, mphFloat);
  //FFDMTTypeToMphFieldType.Add(ftSingle, mphFloat);
  //FFDMTTypeToMphFieldType.Add(ftExtended, mphFloat);

  // txt
  FFDMTTypeToMphFieldType.Add(ftString, mphVarchar);
  FFDMTTypeToMphFieldType.Add(ftWideString, mphVarchar);
  FFDMTTypeToMphFieldType.Add(ftFixedChar, mphVarchar);
  FFDMTTypeToMphFieldType.Add(ftFixedWideChar, mphVarchar);

  // Time / Date
  FFDMTTypeToMphFieldType.Add(ftDate, mphDate);
  FFDMTTypeToMphFieldType.Add(ftTime, mphDate);
  FFDMTTypeToMphFieldType.Add(ftDateTime, mphDate);
  FFDMTTypeToMphFieldType.Add(ftTimeStamp, mphDate);
  FFDMTTypeToMphFieldType.Add(ftTimeStampOffset, mphDate);

  // Boolean
  FFDMTTypeToMphFieldType.Add(ftBoolean, mphBoolean);

  // txt BLOB
  FFDMTTypeToMphFieldType.Add(ftMemo, mphTXTBlob);
  FFDMTTypeToMphFieldType.Add(ftFmtMemo, mphTXTBlob);
  FFDMTTypeToMphFieldType.Add(ftWideMemo, mphTXTBlob);
  FFDMTTypeToMphFieldType.Add(ftOraClob, mphTXTBlob);

  // Binary BLOB
  FFDMTTypeToMphFieldType.Add(ftBlob, mphBinaryBlob);
  FFDMTTypeToMphFieldType.Add(ftBytes, mphBinaryBlob);
  FFDMTTypeToMphFieldType.Add(ftVarBytes, mphBinaryBlob);
  FFDMTTypeToMphFieldType.Add(ftGraphic, mphBinaryBlob);
  FFDMTTypeToMphFieldType.Add(ftTypedBinary, mphBinaryBlob);
  FFDMTTypeToMphFieldType.Add(ftOraBlob, mphBinaryBlob);
  FFDMTTypeToMphFieldType.Add(ftStream, mphBinaryBlob);

  //Others
  //FFDMTTypeToMphFieldType.Add(ftGuid, mphGUID);
  //FFDMTTypeToMphFieldType.Add(ftVariant, mphVariant);
  //FFDMTTypeToMphFieldType.Add(ftObject, mphObject);
  //FFDMTTypeToMphFieldType.Add(ftArray, mphArray);
  //FFDMTTypeToMphFieldType.Add(ftDataSet, mphDataSet);
  {$ENDREGION}

  FFieldsToProcess := TMorphFields.Create;
  FStage := mpsCreate;
  FPSQLCommand := '';
  FIgnoreCreatedStructure := False;

  FDQResult := TFDQuery.Create(Nil);
  FDQResult.FetchOptions.Mode := fmAll;
  FInsertTable := TMphTable.Create;
  FSettings := TMorphSettings.Create;
  FInsertFromVisualComponents := TInsertFromVisualComponents.Create;
  FMorphSQLExecutor := TMorphSQLExecutor.Create;
end;

function TMorph.CreateTable: TMorph;
var
  vFieldCount : Integer;
  vField : TMorphField;
begin
  try
    FPSQLCommand := PSQL_FB5_CREATE_TABLE+PSQL_SPACE+FTableName+PSQL_SPACE+PSQL_OPEN_PARENTHESES+PSQL_SPACE;

    FFieldsToProcess.First;
    for vFieldCount := 0 to FFieldsToProcess.Count -1 do
    begin
      vField := FFieldsToProcess.Elements[vFieldCount];

      if vFieldCount > 0 then
        FPSQLCommand:=FPSQLCommand+ PSQL_COMMA;

      FPSQLCommand:=FPSQLCommand+ vField.Name+PSQL_SPACE+GetPSQLTypeName;

      if FFieldsToProcess.Current.FieldType = mphVarchar then
        FPSQLCommand:=FPSQLCommand+ PSQL_OPEN_PARENTHESES+IntToStr(FFieldsToProcess.Current.Size)+PSQL_CLOSED_PARENTHESES;

      if vField.Identity then
        FPSQLCommand:=FPSQLCommand+ PSQL_SPACE+PSQL_FB5_IDENTITY;

      if vField.PrimaryKey then
        FPSQLCommand:=FPSQLCommand+ PSQL_SPACE+PSQL_FB5_PRIMARY_KEY;

      if vField.NotNull then
        FPSQLCommand:=FPSQLCommand+ PSQL_SPACE+PSQL_FB5_NOT_NULL;

      if vField.Unique then
        FPSQLCommand:=FPSQLCommand+ PSQL_SPACE+PSQL_FB5_UNIQUE;

      if NOT FFieldsToProcess.Eof then
        FFieldsToProcess.Next;
    end;

    FFieldsToProcess.First;
    for vFieldCount := 0 to FFieldsToProcess.Count -1 do   //FK
    begin
      vField := FFieldsToProcess.Elements[vFieldCount];
      if vField.ForeignKey then
      begin
        {FK_<SourceTable>_<DesntinationTable>}
        FPSQLCommand:=FPSQLCommand+PSQL_COMMA+PSQL_SPACE+PSQL_FB5_CONSTRAINT+PSQL_SPACE+vField.FKName+PSQL_SPACE+PSQL_FB5_FOREIGN_KEY+PSQL_SPACE+PSQL_OPEN_PARENTHESES+vField.Name+PSQL_CLOSED_PARENTHESES+PSQL_SPACE+PSQL_FB5_REFERENCES+PSQL_SPACE+vField.ReferencedTable+PSQL_OPEN_PARENTHESES+vField.ReferencedField+PSQL_CLOSED_PARENTHESES+PSQL_SPACE+PSQL_FB5_ON;
                                             {CONSTRAINT                      FK_ORDER_CLIENT                    FOREIGN KEY                     (                      CLIENT_ID  )                                  REFERENCES          CLIENT                 (                     ID                     )                                  ON}
        case vField.RelationsBehavior of
          mrbNoOrphanData: FPSQLCommand:=FPSQLCommand+PSQL_SPACE+PSQL_FB5_UPDATE+PSQL_SPACE+PSQL_FB5_CASCADE;
          mrbNullOrphanData: FPSQLCommand:=FPSQLCommand+PSQL_SPACE+PSQL_FB5_DELETE+PSQL_SPACE+PSQL_FB5_SET+PSQL_SPACE+PSQL_FB5_NULL+PSQL_SPACE+PSQL_FB5_ON+PSQL_SPACE+PSQL_FB5_UPDATE+PSQL_SPACE+PSQL_FB5_CASCADE;
          mrbDeleteOrphanData: FPSQLCommand:=FPSQLCommand+PSQL_SPACE+PSQL_FB5_DELETE+PSQL_SPACE+PSQL_FB5_CASCADE+PSQL_SPACE+PSQL_FB5_ON+PSQL_SPACE+PSQL_FB5_UPDATE+PSQL_SPACE+PSQL_FB5_CASCADE;
        end;

      end;

      if NOT FFieldsToProcess.Eof then
        FFieldsToProcess.Next;
    end;

    FPSQLCommand:=FPSQLCommand+PSQL_CLOSED_PARENTHESES+PSQL_SEMICOLON;

    try
      ExecutePSQL(FPSQLCommand);
    finally
      FPSQLCommand := '';
    end;
  finally
    FFieldsToProcess.Clear;
  end;
end;

function TMorph.CurrentPSQL(out anOutVar: String): TMorph;
begin
  anOutVar := FPSQLCommand;
  Result := Self;
end;

function TMorph.DatabaseType(const ADBType: TMorphDBType): TMorph;
begin
  FSettings.DatabaseType(ADBType);
  Result := Self;
end;

function TMorph.DateOrientation(
  const anOrientation: TMorphDateOrientation): TMorph;
begin
  FDataOrientation := anOrientation;
  Result := Self;
end;

function TMorph.tDate: TMorph;
begin
  FFieldsToProcess.Current.FieldType := mphDate;
  Result := Self;
end;

function TMorph.Delete: TMorph;
begin

end;

function TMorph.DeleteOrphanData: TMorph;
begin
  FFieldsToProcess.Current.RelationsBehavior := mrbDeleteOrphanData;
  FStage := mpsCreate;
  Result := Self;
end;

destructor TMorph.Destroy;
begin
  FFieldsToProcess.Free;
  FInsertTable.Free;
  FFDMTTypeToMphFieldType.Free;
  FSettings.Free;
  FInsertFromVisualComponents.Free;
  FMorphSQLExecutor.Free;
  inherited;
end;

function TMorph.DoNotRaiseOnRedundances: TMorph;
begin

end;

function TMorph.Drop: TMorph;
begin
  case FSettings.DatabaseType of
    FB2_5: FPSQLCommand:=PSQL_FB2_5_DROP_TABLE+PSQL_SPACE+FTableName;

    FB5:
    begin
      if FFieldsToProcess.Count = 0 then //Drop Table
        FPSQLCommand:=PSQL_FB5_DROP_TABLE+PSQL_SPACE+FTableName
      else //Drop Field
      begin
        try
          FPSQLCommand:=PSQL_FB5_ALTER_TABLE+PSQL_SPACE+FTableName+PSQL_SPACE+PSQL_FB5_DROP+PSQL_SPACE+FFieldsToProcess.Current.Name;
        finally
          FFieldsToProcess.Clear;
        end;
      end;
    end;
  end;

  try
    ExecutePSQL(FPSQLCommand);
  finally
    FPSQLCommand := '';
    Result := Self;
  end;
end;

function TMorph.Equals<T>(const aValue: T): TMorph;
begin

end;

function TMorph.OpenPSQL(const aCommand: String): TMorph;
begin
  FMorphSQLExecutor.RunSQL(aCommand, mqaOpen);
end;

function TMorph.ExportSettings: TJSONObject;
begin

end;

function TMorph.FDMTableFieldTypeConvert(
  const aFieldType: TFieldType): TMorphFieldTypes;
begin
  if NOT FFDMTTypeToMphFieldType.TryGetValue(aFieldType, Result) then
    Raise Exception.Create(Format(MORPH_MESSAGE_UNSUPORTED_FIELD_TYPE, [GetEnumName(TypeInfo(TFieldType), Ord(aFieldType))]));
end;

function TMorph.Field(const AField: String): TMorph;
begin
  case FStage of
    mpsCreate:
    begin
      FFieldsToProcess.Add(TMorphField.Create);
      FFieldsToProcess.Current.Name := aField;
    end;
    mpsReference:
    begin
      FFieldsToProcess.Current.ReferencedField := aField;
    end;
    mpsInsertFromVisualComponent: FInsertFromVisualComponents.SetFieldName(AField);
  end;

  Result := Self;
end;

function TMorph.Fields(const aFieldNames: TArray<String>): TMorph;
var
  LFieldName : String;
begin
  for LFieldName in aFieldNames do
    FInserTTable.Fields.Add(TMorphField.New.SetName(LFieldName));

  Result := Self;
end;

function TMorph.FKName(const aFKName: String): TMorph;
begin
  FFieldsToProcess.Current.FKName := aFKName;
  Result := Self;
end;

function TMorph.tFloat: TMorph;
begin
  FFieldsToProcess.Current.FieldType := mphFloat;
  Result := Self;
end;

function TMorph.ForeignKey: TMorph;
begin
  FFieldsToProcess.Current.ForeignKey := True;
  Result := Self;
end;

function TMorph.From(const aTableName: String): TMorph;
begin
  case FSettings.DatabaseType of
    FB2_5: FPSQLCommand:=FPSQLCommand+PSQL_SPACE+PSQL_FB2_5_FROM+PSQL_SPACE+ aTablename;
    FB5: FPSQLCommand:=FPSQLCommand+PSQL_SPACE+PSQL_FB2_5_FROM+PSQL_SPACE+ aTablename;
  end;

  Result := Self;
end;

function TMorph.GetBasicType(const aValue: TValue): TMorphBasicTypes;
begin
  if aValue.IsEmpty then
    Result := mbtString
  else if aValue.IsType<Integer> or aValue.IsType<Single> or aValue.IsType<Double> or aValue.IsType<Currency> then
    Result := mbtNumber
  else if aValue.IsType<string> then
    Result := mbtString
  else if aValue.IsType<TDateTime> then
    Result := mbtDate
  else if aValue.IsType<Boolean> then
    Result := mbtBoolean
  else
    Raise Exception.Create(Format(MORPH_MESSAGE_COULD_NOT_DETTECT_TYPE, [aValue.ToString]));
end;

function TMorph.GetDBType: TMorphDBType;
begin
  Result := FSettings.DatabaseType;
end;

function TMorph.GetFB2_5FieldTypeName: String;
begin

end;

function TMorph.GetFB5FieldTypeName: String;
begin
  FFB5FieldTypeNames.TryGetValue(Ord(FFieldsToProcess.Current.FieldType), Result);
end;

function TMorph.GetPSQLTypeName: String;
begin
  case FSettings.DatabaseType of
    FB2_5: Result := GetFB5FieldTypeName;
    FB5: Result := GetFB5FieldTypeName;
  end;
end;

function TMorph.GetTableNames: TMorphVector<String>;
begin
  OpenPSQL(PSQL_FB5_LIST_TABLES);
  Result := TMorphVector<String>.Create;
  FDQResult.First;
  while NOT FDQResult.Eof do
  begin
    Result.Add(FDQResult.Fields[0].AsString);
    FDQResult.Next;
  end;
end;

function TMorph.Identity: TMorph;
begin
  FFieldsToProcess.Current.Identity := True;
  Result := Self;
end;

function TMorph.IgnoreCreatedStructure: TMorph;
begin
  FIgnoreCreatedStructure := True;
end;

function TMorph.Insert(const aMphTable: TMphTable): TMorph;
begin
  FInsertTable := aMphTable.Clone;
  Post;
end;

function TMorph.Insert(const aJSONInsert: String): TMorph;
var
  InsertJSONObject, LineJSONObject : TJSONObject;
  InsertJSONArray : TJSONArray;
  TempJSONLine, TempJSONKeyValue : TJSONValue;
  JSONKeysIndex : Integer;
  TempJSONString : String;
begin
  InsertJSONObject := TJSONObject.Create;
  InsertJSONArray := TJSONArray.Create;
  try
    FInsertTable.Clear;
    try
      InsertJSONObject := TJSONObject(TJSONObject.ParseJSONValue(aJSONInsert));

      if Assigned(InsertJSONObject) then
        if InsertJSONObject.Count <= 0 then
          Raise Exception.Create(MORPH_MESSAGE_EMPTY_INSERT_JSON);

      FInsertTable.Name := InsertJSONObject.Pairs[0].JsonString.Value;
      InsertJSONArray := InsertJSONObject.GetValue<TJSONArray>(FInsertTable.Name);

      if Assigned(InsertJSONArray) then
        if InsertJSONArray.Count <= 0 then
          Raise Exception.Create(MORPH_MESSAGE_EMPTY_INSERT_JSON);

      LineJSONObject := InsertJSONArray.Items[0] as TJSONObject;

      for JSONKeysIndex := 0 to LineJSONObject.Count -1 do //Keys to Fields
        FInsertTable.Fields.Add(TMorphField.New.SetName(LineJSONObject.Pairs[JSONKeysIndex].JsonString.Value));

      for TempJSONLine in InsertJSONArray do //Lines:
      begin
        LineJSONObject := TempJSONLine as TJSONObject;

        for JSONKeysIndex := 0 to LineJSONObject.Count -1 do //Values
        begin
          TempJSONKeyValue := LineJSONObject.Pairs[JSONKeysIndex].JsonValue;
          {$REGION 'Saves value in table with correct type'}
          if TempJSONKeyValue is TJSONNumber then
          begin
            if Pos('.', TempJSONKeyValue.ToString) > 0 then
            begin
              FInsertTable.Fields.Elements[JSONKeysIndex].FieldType := mphFloat;
              FInsertTable.Fields.Elements[JSONKeysIndex].AddValue(TempJSONKeyValue.AsType<Double>);
            end
            else
            begin
              FInsertTable.Fields.Elements[JSONKeysIndex].FieldType := mphFloat;
              FInsertTable.Fields.Elements[JSONKeysIndex].AddValue(TempJSONKeyValue.AsType<Integer>);
            end;
          end
          else if TempJSONKeyValue is TJSONBool then
          begin
            FInsertTable.Fields.Elements[JSONKeysIndex].FieldType := mphBoolean;
            FInsertTable.Fields.Elements[JSONKeysIndex].AddValue(TempJSONKeyValue.AsType<Boolean>);
          end
          else
          begin
            FInsertTable.Fields.Elements[JSONKeysIndex].FieldType := mphVarchar;
            TempJSONString := TempJSONKeyValue.Value;
            FInsertTable.Fields.Elements[JSONKeysIndex].AddValue(TempJSONString);
          end;
          {$ENDREGION}
        end;
      end;

    except on E : Exception do
      if E.Message = MORPH_MESSAGE_EMPTY_INSERT_JSON then
        Raise E
      else
        Raise Exception.Create(MORPH_MESSAGE_INVALID_JSON_OBJECT);
    end;

    Post;

  finally
    InsertJSONObject.Free;
  end;
end;

function TMorph.Insert: TMorph;
begin
  try
    FInsertFromVisualComponents.Insert;
  finally
    FInsertFromVisualComponents.Clear;
  end;
end;

function TMorph.InsertInto: TMorph;
begin
  FStage := mpsInsert;
  Result := Self;
end;

function TMorph.Max(const AFieldName: String): TMorph;
begin
  FPSQLCommand:=FPSQLCommand+PSQL_SPACE+PSQL_FB5_MAX+PSQL_OPEN_PARENTHESES+AFieldName+PSQL_CLOSED_PARENTHESES;
  Result := Self;
end;

function TMorph.Min(const AFieldName: String): TMorph;
begin
  FPSQLCommand:=FPSQLCommand+PSQL_SPACE+PSQL_FB5_MIN+PSQL_OPEN_PARENTHESES+AFieldName+PSQL_CLOSED_PARENTHESES;
  Result := Self;
end;

function TMorph.tInteger: TMorph;
begin
  FFieldsToProcess.Current.FieldType := mphInteger;
  Result := Self;
end;

class function TMorph.New: TMorph;
begin
  Result := TMorph.Create;
end;

function TMorph.NoOrphanData: TMorph;
begin
  FFieldsToProcess.Current.RelationsBehavior := mrbNoOrphanData;
  FStage := mpsCreate;
  Result := Self;
end;

function TMorph.NotNull: TMorph;
begin
  FFieldsToProcess.Current.NotNull := True;
  FStage := mpsCreate;
  Result := Self;
end;

function TMorph.NullOrphanData: TMorph;
begin
  FFieldsToProcess.Current.RelationsBehavior := mrbNullOrphanData;
  FStage := mpsCreate;
  Result := Self;
end;

function TMorph.Post: TMorph;
var
  LFieldCount, LValueCount : Integer;
  FPSQLInsertBase : String;
begin
  try
    case FSettings.DatabaseType of
      FB2_5:;
      FB5:
      begin
        FPSQLCommand:= PSQL_FB5_INSERT_INTO+PSQL_SPACE+FInsertTable.Name+PSQL_SPACE+PSQL_OPEN_PARENTHESES;
                      {INSERT INTO CLIENT              (                     }

        FInsertTable.Fields.First;
        for LFieldCount := 0 to FInsertTable.Fields.Count -1 do
        begin
          if LFieldCount > 0 then
            FPSQLCommand:=FPSQLCommand+PSQL_COMMA+PSQL_SPACE;

          FPSQLCommand:=FPSQLCommand+ FInsertTable.Fields.Elements[LFieldCount].Name;

          if NOT FFieldsToProcess.Eof then
            FFieldsToProcess.Next;
        end;
        {ID, NAME, EMAIL, PHONE}
        FPSQLCommand:=FPSQLCommand+PSQL_CLOSED_PARENTHESES+PSQL_SPACE+PSQL_FB5_VALUES+PSQL_SPACE+PSQL_OPEN_PARENTHESES;
                                   {)                      VALUES          (}
        FPSQLInsertBase := FPSQLCommand;

        FInsertTable.Fields.First;
        for LValueCount := 0 to FInsertTable.Fields.Elements[0].Values.Count -1 do //Values
        begin

          FPSQLCommand := FPSQLInsertBase;
          for LFieldCount := 0 to FInsertTable.Fields.Count -1 do //Fields
          begin
            if LFieldCount > 0 then
              FPSQLCommand:=FPSQLCommand+PSQL_COMMA+PSQL_SPACE;

            case FInsertTable.Fields.Elements[LFieldCount].FieldType of
              mphVarchar, mphUndefined:FPSQLCommand:=FPSQLCommand+QuotedStr(FInsertTable.Fields.Elements[LFieldCount].Values.Elements[LValueCount].ToString);
              mphDate:FPSQLCommand:=FPSQLCommand+PSQL_FB5_CAST+PSQL_OPEN_PARENTHESES+QuotedStr(TMorphDSUtls.UsrDateToDBDate(FInsertTable.Fields.Elements[LFieldCount].Values.Elements[LValueCount].ToString, FDataOrientation))+PSQL_SPACE+PSQL_AS+PSQL_SPACE+PSQL_FB5_TYPE_DATE+PSQL_CLOSED_PARENTHESES;
                                                 {CAST         (                              '2025/12/01'                                                                                           AS                 DATE               )}
              else
                FPSQLCommand:=FPSQLCommand+FInsertTable.Fields.Elements[LFieldCount].Values.Elements[LValueCount].ToString;
            end;
          end;
          {1, 'John Smith', 'john@email.com', '9999-1111');}
          FPSQLCommand:=FPSQLCommand+PSQL_CLOSED_PARENTHESES+PSQL_SEMICOLON;

          try
            ExecutePSQL(FPSQLCommand);
          finally
            FPSQLCommand := '';
          end;
        end;
      end;
    end;
  finally
    FFieldsToProcess.Clear;
    FInsertTable.Clear;
    FStage := mpsCreate;
  end;
  Result := Self;
end;

function TMorph.PrimaryKey: TMorph;
begin
  FFieldsToProcess.Current.PrimaryKey := True;
  Result := Self;
end;

function TMorph.References: TMorph;
begin
  FStage := mpsReference;
  Result := Self;
end;

procedure TMorph.ReloadDBTablesAndFieldsList;
begin
  OpenPSQL(PSQL_FB5_LIST_TABLES_AND_FIELDS);
  try
  //  FTablesVector.Clear;
  //  FTablesVector.Add
  finally
    FDQResult.Free;
  end;
end;

procedure TMorph.ExecutePSQL(const aCommand: String);
begin
  FMorphSQLExecutor.RunSQL(aCommand, mqaExecute);
end;

function TMorph.Select: TMorph;
begin
  case FSettings.DatabaseType of
    FB2_5: FPSQLCommand:=FPSQLCommand+ PSQL_FB2_5_SELECT;
    FB5: FPSQLCommand:=FPSQLCommand+PSQL_SPACE+ PSQL_FB5_SELECT;
  end;

  Result := Self;
end;

function TMorph.Settings(const ASettings: TMorphSettings): TMorph;
begin
  FSettings := ASettings;
end;

function TMorph.Table(const aTableName: String): TMorph;
begin
  case FStage of
    mpsCreate:
    begin
      FTableName := aTableName;
      FFieldsToProcess.Clear;
    end;

    mpsReference: FFieldsToProcess.Current.ReferencedTable := aTableName;

    mpsInsert:
    begin
      FTableName := aTableName;
      FInsertTable.Clear;
      FInserttable.Name := aTablename;
    end;
  end;

  Result := Self;
end;

function TMorph.Unique: TMorph;
begin
  FFieldsToProcess.Current.Unique := True;
  Result := Self;
end;

function TMorph.Values(const aValues: TArray<TValue>): TMorph;
var
  LFieldsCount : Integer;
begin
  for LFieldsCount := 0 to High(aValues) do
  begin
    if FInsertTable.Fields.Elements[LFieldsCount].FieldType = mphUndefined then
      case GetBasicType(aValues[LFieldsCount]) of
        mbtNumber:  FInsertTable.Fields.Elements[LFieldsCount].FieldType := mphFloat;
        mbtString: FInsertTable.Fields.Elements[LFieldsCount].FieldType := mphVarchar;
        mbtDate: FInsertTable.Fields.Elements[LFieldsCount].FieldType := mphDate;
        mbtBoolean: FInsertTable.Fields.Elements[LFieldsCount].FieldType := mphBoolean;
      end;

    FInsertTable.Fields.Elements[LFieldsCount].Values.Add(aValues[LFieldsCount]);
  end;

  Result := Self;
end;

function TMorph.Where(const aWhereInstruction: W): TMorph;
begin

end;

function TMorph._And: TMorph;
begin
  Result := Self;
end;

function TMorph._Or: TMorph;
begin
  Result := Self;
end;

function TMorph.tVarchar(const aSize: Integer): TMorph;
begin
  FFieldsToProcess.Current.FieldType := mphVarchar;
  FFieldsToProcess.Current.Size := aSize;
  Result := Self;
end;

end.
