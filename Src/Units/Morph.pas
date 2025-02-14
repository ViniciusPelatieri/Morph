unit Morph;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, System.JSON,
  Morph.EnumeratedTypes, Morph.MorphTable, Morph.Field, Morph.Settings,
  System.Generics.Collections, Morph.Vector, Datasnap.DBClient;

type
  TMorph = class
    private
      FTableName : String;
      FFieldsToProcess : TMorphFields;
      FStage : TMorphStages;
      FPSQLCommand : String;
      FDBType : TMorphDBType;
      FFDConnection : TFDConnection;
      FDQResult : TFDQuery;
      FTempConnection : TFDConnection;

      FFB2_5FieldTypeNames : TDictionary<Integer, String>;
      FFB5FieldTypeNames : TDictionary<Integer, String>;

      procedure RunPSQL(const aCommand : String; const aQryAction : TMorphQryAction);
    public
      constructor Create;
      destructor Destroy; override;
      function tVarchar(const aSize : Integer) : TMorph;
      function Config : TMorph;
      function DatabaseType(const aDBType : TMorphDBType) : TMorph;
      function Connection(const aConnection : TFDConnection) : TMorph;
      function OutputFDMemTable(const anOutputTable : TFDMemTable) : TMorph;
      function OutputMorphTable(const aMorphTable : TMphTable) : TMorph;
      function IgnoreCreatedStructure : TMorph;
      function DoNotRaiseOnRedundances : TMorph;
      function RunFindInAnOtherThread : TMorph;
      function LoadSettings(const aMorphSettings : TMorphSettings) : TMorph;
      function ExportSettings : TJSONObject;
      function Return : TMorph;
      function AsMorphTable : TMphTable;
      function AsJSONString : String;
      function AsTFDMemTable : TFDMemTable;
      function Table(const aTableName : String) : TMorph;
      function Drop : TMorph;
      function ChangeNameTo(const aNewName : String) : TMorph;
      function Field(const aField : String) : TMorph;
      function tInteger : TMorph;
      function tBoolean : TMorph;
      function tFloat : TMorph;
      function tDate : TMorph;
      function tBinaryBlob : TMorph;
      function PrimaryKey : TMorph;
      function Identity : TMorph;
      function NotNull : TMorph;
      function Unique : TMorph;
      function Add : TMorph;
      function FieldsInfo : TMorphTableFieldsInfo;
      function FieldInfo : TMorphTableFieldInfo;
      function InsertInto : TMorph;
      function InsertJSONStringInto : TMorph;
      function Value<T>(const aValue : T) : TMorph;
      function Fields(const Fields : TArray<string>) : TMorph;
      function Values(const Fields : TArray<string>) : TMorph;
      function InsertJSON(const aJSONString : String) : TMorph;
      function JSONContent(const aJSONString : String) : TMorph;
      function InserFDMEMtableInto(const aTableName : String) : TMorph;
      function FDMemTable(const aFDMemTable : TFDMemTable) : TMorph;
      function ImportSettings(const aConfigJSONString : String) : TMorph;
      function Update : TMorph;
      function SetField(const aFieldName : String) : TMorph;
      function NewValue<T>(const aNewValue : T) : TMorph;
      function Where : TMorph;
      function SetFields(const Fields : TArray<String>) : TMorph;
      function NewValues(const NewValues : TArray<String>) : TMorph;
      function ForeignKey : TMorph;
      function References : TMorph;
      function NoOrphaData : TMorph;
      function Post : TMorph;
      function Content(const aMorphTable : TMphTable) : TMorph;
      class function JSONParse(const aJSONString : String) : TMphTable;
      function Equals<T>(const aValue : T) : TMorph;
      function IsBiggerThan<T>(const aValue : T) : TMorph;
      function _And : TMorph;
      function IsSmallerThen<T>(const aValue : T) : TMorph;
      function Select : TMorph;
      function All : TMorph;
      function From(const aTableName : String) : TMorph;
      function IsBiggerOrEqualThen<T>(const aValue : T) : TMorph;
      function _Or : TMorph;
      function IsSmallerOrEqualThen<T>(const aValue : T) : TMorph;
      function CreateTable : TMorph;
      function CurrentPSQL(Out anOutVar : String) : TMorph;
      function GetPSQLTypeName : String;
      function GetFB5FieldTypeName : String;
      function GetFB2_5FieldTypeName : String;
      procedure ExecutePSQL(const aCommand : String);
      function GetTableNames : TMorphVector<String>;
      function AsTClientDataSet : TClientDataSet;
      function OpenPSQL(const aCommand: String) : TMorph;
      function FKName(const aFKName : String) : TMorph;
      function NoOrphanData : TMorph;
      function NullOrphanData : TMorph;
      function DeleteOrphanData : TMorph;
      function Delete : TMorph;
    end;
implementation

uses
  Morph.PSQL.Structure.FB5, Morph.PSQL.Structure.Common, System.TypInfo,
  System.SysUtils, Morph.DataSetUtilitys, Morph.PSQL.Structure.FB2_5;

{ TMorph }

function TMorph.Add: TMorph;
begin

end;

function TMorph.All: TMorph;
begin
  case FDBType of
    FB2_5: FPSQLCommand:=FPSQLCommand+PSQL_SPACE+ PSQL_ASTERISK;
    FB5: FPSQLCommand:=FPSQLCommand+PSQL_SPACE+ PSQL_ASTERISK;
  end;

  Result := Self;
end;

function TMorph.AsJSONString: String;
begin

end;

function TMorph.AsMorphTable: TMphTable;
begin

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
  FFieldsToProcess.CurrentField.FieldType := mphBoolean;
  Result := Self;
end;

function TMorph.tBinaryBlob: TMorph;
begin
  FFieldsToProcess.CurrentField.FieldType := mphBinaryBlob;
  Result := Self;
end;

function TMorph.ChangeNameTo(const aNewName: String): TMorph;
begin

end;

function TMorph.Config: TMorph;
begin
  Result := Self;
end;

function TMorph.Connection(const aConnection: TFDConnection): TMorph;
begin
  FFDConnection := aConnection;
  FDQResult.FetchOptions.Mode := fmAll;
  Result := Self;
end;

function TMorph.Content(const aMorphTable: TMphTable): TMorph;
begin

end;

constructor TMorph.Create;
begin
  FFB5FieldTypeNames := TDictionary<Integer, String>.Create;
  FFB5FieldTypeNames.Add(Ord(mphInteger), PSQL_FB5_TYPE_INTEGER);
  FFB5FieldTypeNames.Add(Ord(mphVarchar), PSQL_FB5_TYPE_VARCHAR);
  FFB5FieldTypeNames.Add(Ord(mphFloat), PSQL_FB5_TYPE_FLOAT);
  FFB5FieldTypeNames.Add(Ord(mphDate), PSQL_FB5_TYPE_DATE);
  FFB5FieldTypeNames.Add(Ord(mphBoolean), PSQL_FB5_TYPE_BOOLEAN);
  FFB5FieldTypeNames.Add(Ord(mphTXTBlob), PSQL_FB5_TYPE_TXTBLOB);
  FFB5FieldTypeNames.Add(Ord(mphBinaryBlob), PSQL_FB5_TYPE_BINBLOB);

  FFieldsToProcess := TMorphFields.Create;
  FStage := CreatingTable;
  FPSQLCommand := '';

  FDQResult := TFDQuery.Create(Nil);
end;

function TMorph.CreateTable: TMorph;
var
  vFieldCount : Integer;
  vField : TMorphField;
begin
  FPSQLCommand := PSQL_FB5_CREATE_TABLE+PSQL_SPACE+FTableName+PSQL_SPACE+PSQL_OPEN_PARENTHESES+PSQL_SPACE;

  FFieldsToProcess.First;
  for vFieldCount := 0 to FFieldsToProcess.Count -1 do
  begin
    if vFieldCount > 0 then
      FPSQLCommand:=FPSQLCommand+ PSQL_COMMA;

    vField := FFieldsToProcess.Fields[vFieldCount];

    FPSQLCommand:=FPSQLCommand+ vField.Name+PSQL_SPACE+GetPSQLTypeName;

    if FFieldsToProcess.CurrentField.FieldType = mphVarchar then
      FPSQLCommand:=FPSQLCommand+ PSQL_OPEN_PARENTHESES+IntToStr(FFieldsToProcess.CurrentField.Size)+PSQL_CLOSED_PARENTHESES;

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

    if vField.ForeignKey then
    begin
      {FK_<SourceTable>_<DesntinationTable>}
      FPSQLCommand:=FPSQLCommand+PSQL_COMMA+PSQL_SPACE+PSQL_FB5_CONSTRAINT+PSQL_SPACE+vField.FKName+PSQL_SPACE+PSQL_FB5_FOREIGN_KEY+PSQL_SPACE+PSQL_OPEN_PARENTHESES+vField.Name+PSQL_CLOSED_PARENTHESES+PSQL_FB5_REFERENCES+vField.ReferencedTable+PSQL_OPEN_PARENTHESES+vField.ReferencedField+PSQL_CLOSED_PARENTHESES+PSQL_SPACE+PSQL_FB5_ON;
                                           {CONSTRAINT                      FK_ORDER_CLIENT F       OREIGN KEY                      (                      CLIENT_ID  )                       REFERENCES          CLIENT                 (                     ID                     )                                  ON}

      case vField.RelationsBehavior of
        mrbNoOrphanData: FPSQLCommand:=FPSQLCommand+PSQL_SPACE+PSQL_FB5_UPDATE+PSQL_SPACE+PSQL_FB5_CASCADE;
        mrbNullOrphanData: FPSQLCommand:=FPSQLCommand+PSQL_SPACE+PSQL_FB5_DELETE+PSQL_SPACE+PSQL_FB5_SET+PSQL_SPACE+PSQL_FB5_NULL+PSQL_SPACE+PSQL_FB5_ON+PSQL_SPACE+PSQL_FB5_UPDATE+PSQL_SPACE+PSQL_FB5_CASCADE;
        mrbDeleteOrphanData: FPSQLCommand:=FPSQLCommand+PSQL_SPACE+PSQL_FB5_DELETE+PSQL_SPACE+PSQL_FB5_CASCADE+PSQL_SPACE+PSQL_FB5_ON+PSQL_SPACE+PSQL_FB5_UPDATE+PSQL_SPACE+PSQL_FB5_CASCADE;
      end;

    end;
  end;                 COLOCAR AO FINAL DO COMANDO

  FPSQLCommand:=FPSQLCommand+PSQL_CLOSED_PARENTHESES+PSQL_SEMICOLON;

  ExecutePSQL(FPSQLCommand);
  FPSQLCommand := '';
end;

function TMorph.CurrentPSQL(out anOutVar: String): TMorph;
begin
  anOutVar := FPSQLCommand;
  Result := Self;
end;

function TMorph.DatabaseType(const aDBType: TMorphDBType): TMorph;
begin
  FDBType := aDBType;
  Result := Self;
end;

function TMorph.tDate: TMorph;
begin
  FFieldsToProcess.CurrentField.FieldType := mphDate;
  Result := Self;
end;

function TMorph.Delete: TMorph;
begin

end;

function TMorph.DeleteOrphanData: TMorph;
begin
  FFieldsToProcess.CurrentField.RelationsBehavior := mrbDeleteOrphanData;
  Result := Self;
end;

destructor TMorph.Destroy;
begin
  FFieldsToProcess.Free;
  inherited;
end;

function TMorph.DoNotRaiseOnRedundances: TMorph;
begin

end;

function TMorph.Drop: TMorph;
begin
  case FDBType of
    FB2_5: FPSQLCommand:=FPSQLCommand+PSQL_FB2_5_DROP_TABLE+PSQL_SPACE+FTableName;
    FB5: FPSQLCommand:=FPSQLCommand+PSQL_FB5_DROP_TABLE+PSQL_SPACE+FTableName;
  end;

  ExecutePSQL(FPSQLCommand);
  FPSQLCommand := '';

  Result := Self;
end;

function TMorph.Equals<T>(const aValue: T): TMorph;
begin

end;

function TMorph.OpenPSQL(const aCommand: String): TMorph;
begin
  RunPSQL(aCommand, Open);
end;

function TMorph.ExportSettings: TJSONObject;
begin

end;

function TMorph.FDMemTable(const aFDMemTable: TFDMemTable): TMorph;
begin

end;

function TMorph.Field(const aField: String): TMorph;
begin
  case FStage of
    CreatingTable:
    begin
      FFieldsToProcess.Add(TMorphField.Create);
      FFieldsToProcess.CurrentField.Name := aField;
    end;
    ReferencingTable:
    begin
      FFieldsToProcess.CurrentField.ReferencedField := aField;
    end;
  end;

  Result := Self;
end;

function TMorph.FieldInfo: TMorphTableFieldInfo;
begin

end;

function TMorph.Fields(const Fields: TArray<string>): TMorph;
begin

end;

function TMorph.FieldsInfo: TMorphTableFieldsInfo;
begin

end;

function TMorph.FKName(const aFKName: String): TMorph;
begin
  FFieldsToProcess.CurrentField.FKName := aFKName;
  Result := Self;
end;

function TMorph.tFloat: TMorph;
begin
  FFieldsToProcess.CurrentField.FieldType := mphFloat;
  Result := Self;
end;

function TMorph.ForeignKey: TMorph;
begin
  FFieldsToProcess.CurrentField.ForeignKey := True;
  Result := Self;
end;

function TMorph.From(const aTableName: String): TMorph;
begin
  case FDBType of
    FB2_5: FPSQLCommand:=FPSQLCommand+PSQL_SPACE+PSQL_FB2_5_FROM+PSQL_SPACE+ aTablename;
    FB5: FPSQLCommand:=FPSQLCommand+PSQL_SPACE+PSQL_FB2_5_FROM+PSQL_SPACE+ aTablename;
  end;

  Result := Self;
end;

function TMorph.GetFB2_5FieldTypeName: String;
begin

end;

function TMorph.GetFB5FieldTypeName: String;
begin
  FFB5FieldTypeNames.TryGetValue(Ord(FFieldsToProcess.CurrentField.FieldType), Result);
end;

function TMorph.GetPSQLTypeName: String;
begin
  case FDBType of
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
  FFieldsToProcess.CurrentField.Identity := True;
  Result := Self;
end;

function TMorph.IgnoreCreatedStructure: TMorph;
begin

end;

function TMorph.ImportSettings(const aConfigJSONString: String): TMorph;
begin

end;

function TMorph.InserFDMEMtableInto(const aTableName: String): TMorph;
begin

end;

function TMorph.InsertInto: TMorph;
begin

end;

function TMorph.InsertJSON(const aJSONString: String): TMorph;
begin

end;

function TMorph.InsertJSONStringInto: TMorph;
begin

end;

function TMorph.tInteger: TMorph;
begin
  FFieldsToProcess.CurrentField.FieldType := mphInteger;
  Result := Self;
end;

function TMorph.IsBiggerOrEqualThen<T>(const aValue: T): TMorph;
begin

end;

function TMorph.IsBiggerThan<T>(const aValue: T): TMorph;
begin

end;

function TMorph.IsSmallerOrEqualThen<T>(const aValue: T): TMorph;
begin

end;

function TMorph.IsSmallerThen<T>(const aValue: T): TMorph;
begin

end;

function TMorph.JSONContent(const aJSONString: String): TMorph;
begin

end;

class function TMorph.JSONParse(const aJSONString: String): TMphTable;
begin

end;

function TMorph.LoadSettings(const aMorphSettings : TMorphSettings): TMorph;
begin

end;

function TMorph.NewValue<T>(const aNewValue: T): TMorph;
begin

end;

function TMorph.NewValues(const NewValues: TArray<String>): TMorph;
begin

end;

function TMorph.NoOrphaData: TMorph;
begin
  FFieldsToProcess.CurrentField.NoOrphaData := True;
  Result := Self;
end;

function TMorph.NoOrphanData: TMorph;
begin
  FFieldsToProcess.CurrentField.RelationsBehavior := mrbNoOrphanData;
  Result := Self;
end;

function TMorph.NotNull: TMorph;
begin
  FFieldsToProcess.CurrentField.NotNull := True;
  Result := Self;
end;

function TMorph.NullOrphanData: TMorph;
begin
  FFieldsToProcess.CurrentField.RelationsBehavior := mrbNullOrphanData;
  Result := Self;
end;

function TMorph.OutputFDMemTable(const anOutputTable: TFDMemTable): TMorph;
begin

end;

function TMorph.OutputMorphTable(const aMorphTable: TMphTable): TMorph;
begin

end;

function TMorph.Post: TMorph;
begin

end;

function TMorph.PrimaryKey: TMorph;
begin
  FFieldsToProcess.CurrentField.PrimaryKey := True;
  Result := Self;
end;

function TMorph.References: TMorph;
begin
  FStage := ReferencingTable;
  Result := Self;
end;

function TMorph.Return: TMorph;
begin

end;

function TMorph.RunFindInAnOtherThread: TMorph;
begin

end;

procedure TMorph.RunPSQL(const aCommand: String;
  const aQryAction: TMorphQryAction);
begin
  if Assigned(FDQResult) then
    FDQResult.Free;

  if Assigned(FTempConnection) then
  begin
    FTempConnection.Close;
    FTempConnection.Free;
  end;

  FDQResult := TFDQuery.Create(Nil);
  FTempConnection := TFDConnection.Create(Nil);

  FTempConnection.Params.DriverID := FFDConnection.Params.DriverID;
  FTempConnection.Params.Database := FFDConnection.Params.Database;
  FTempConnection.Params.UserName := FFDConnection.Params.UserName;
  FTempConnection.Params.Password := FFDConnection.Params.Password;
  FTempConnection.TxOptions.AutoCommit := True;
  FTempConnection.LoginPrompt := False;
  FTempConnection.Open;

  FDQResult.Connection := FTempConnection;
  FDQResult.FetchOptions.Mode := fmAll;
  FDQResult.SQL.Text := aCommand;

  case aQryAction of
    Open: FDQResult.Open;
    Execute: FDQResult.ExecSQL;
  end;

end;

procedure TMorph.ExecutePSQL(const aCommand: String);
begin
  RunPSQL(aCommand, Execute);
end;

function TMorph.Select: TMorph;
begin
  case FDBType of
    FB2_5: FPSQLCommand:=FPSQLCommand+ PSQL_FB2_5_SELECT;
    FB5: FPSQLCommand:=FPSQLCommand+ PSQL_FB5_SELECT;
  end;

  Result := Self;
end;

function TMorph.SetField(const aFieldName: String): TMorph;
begin

end;

function TMorph.SetFields(const Fields: TArray<String>): TMorph;
begin

end;

function TMorph.Table(const aTableName: String): TMorph;
begin
  case FStage of
    CreatingTable:
    begin
      FTableName := aTableName;
      FFieldsToProcess.Clear;
    end;

    ReferencingTable:
    begin
      FFieldsToProcess.CurrentField.ReferencedTable := aTableName;
    end;
  end;

  FStage := CreatingTable;
  Result := Self;
end;

function TMorph.Unique: TMorph;
begin
  FFieldsToProcess.CurrentField.Unique := True;
  Result := Self;
end;

function TMorph.Update: TMorph;
begin

end;

function TMorph.Value<T>(const aValue: T): TMorph;
begin

end;

function TMorph.Values(const Fields: TArray<string>): TMorph;
begin

end;

function TMorph.tVarchar(const aSize: Integer): TMorph;
begin
  FFieldsToProcess.CurrentField.FieldType := mphVarchar;
  FFieldsToProcess.CurrentField.Size := aSize;
  Result := Self;
end;

function TMorph.Where: TMorph;
begin

end;

function TMorph._And: TMorph;
begin

end;

function TMorph._Or: TMorph;
begin

end;

end.
