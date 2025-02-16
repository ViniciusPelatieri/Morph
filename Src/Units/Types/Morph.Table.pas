unit Morph.Table;

interface

uses
  Morph.Settings, FireDAC.Comp.Client, System.Classes, System.Rtti,
  Morph.EnumeratedTypes, Morph.Vector, Morph.Field;

type

  TMphTable = class
    private
      FName : String;
      FFields : TMorphFields;
      FCurrentFieldName : String;
    private
      function ContainsField(const aFieldName : String) : Boolean;
    public
      constructor Create;
      destructor Destroy; override;
      function ImportSettings(const aJSONSettings : TMorphSettings) : TMphTable;
      function ExportSettings : TMorphSettings;
      function InsertInto(const aTableName : String) : TMphTable;
      function AsFDMemtable : TFDMemTable;
      function AsJSONString : String;
      function LoadFromFDMemtable(const aMemtable : TFDMemTable) : TMphTable;
      function LoadFromJSONString(const aJSONString : String) : TMphTable;
      procedure Clear;
      function AddField(const aFieldName : String) : TMphTable;
      function TypeInteger : TMphTable;
      function NewLine : TMphTable;
      function TypeString : TMphTable;
      function FieldByName(const aFieldName : String) : TMphTable;
      function AsValue(const aValue : TValue) : TMphTable;
      function FieldIdByName(const aFieldName : String) : Integer;

      //overloaded
      function Field(const aFieldID : Integer): TMphTable; overload;
      function Field(const aFieldName : String): TMphTable; overload;

      property Name : String read FName write FName;
      property Fields : TMorphFields read FFields write FFields;
  end;

  TMphTableArrange = class
    private
    public
      function ImportSettings(const aJSONSettings : TMorphSettings) : TMphTableArrange;
      function ExportSettings : TMorphSettings;
      function Name(const aTableName : String) : TMphTable;
  end;

implementation

uses
  System.SysUtils, Morph.Messages;

{ TMphTable }

function TMphTable.AddField(const aFieldName: String): TMphTable;
begin
  if ContainsField(aFieldName) then
    Raise Exception.Create(Format(MORPH_MESSAGE_FIELD_DUPLICATE, [aFieldName]));

  FCurrentFieldName := aFieldName;
  Result := Self;
end;

function TMphTable.AsFDMemtable: TFDMemTable;
begin

end;

function TMphTable.AsJSONString: String;
begin

end;

function TMphTable.AsValue(const aValue: TValue): TMphTable;
begin
  FFields.CurrentField.Values.SetCurrentElement(aValue);
  Result := Self;
end;

procedure TMphTable.Clear;
begin
  FName := '';
  FCurrentFieldName := '';

  if Assigned(FFields) then
    FFields.Clear
  else
    FFields := TMorphFields.Create;
end;

function TMphTable.ContainsField(const aFieldName: String): Boolean;
var
  LTempField : TMorphField;
begin
  Result := False;
  for LTempField in Fields.Elements do
    if LTempField.Name = aFieldName then
    begin
      Result := True;
      Break;
    end;
end;

constructor TMphTable.Create;
begin
  FFields := TMorphFields.Create;
end;

destructor TMphTable.Destroy;
begin
  FFields.Free;
  inherited;
end;

function TMphTable.ExportSettings: TMorphSettings;
begin

end;

function TMphTable.Field(const aFieldName: String): TMphTable;
var
  LFieldID : Integer;
begin
  LFieldID := FieldIdByName(aFieldName);

  if LFieldID < 0 then
    Raise Exception.Create(Format(MORPH_MESSAGE_FIELD_NOT_FOUND, [aFieldName, FName]));

  FFields.RecNo := LFieldID;
  Result := Self;
end;

function TMphTable.Field(const aFieldID: Integer): TMphTable;
begin
  if (aFieldID > FFields.Count -1) OR (aFieldID < 0) then
    Raise Exception.Create(Format(MORPH_MESSAGE_NOT_VALID_FIELD_IDENTIFICATOR, [IntToStr(aFieldID)]));

  FFields.RecNo := aFieldID;
  Result := Self;
end;

function TMphTable.FieldByName(const aFieldName: String): TMphTable;
begin

end;

function TMphTable.FieldIdByName(const aFieldName: String): Integer;
var
  LFieldIndex : Integer;
begin
  Result := -1;
  for LFieldIndex := 0 to FFields.ElementsCount -1 do
    if FFields.Elements[LFieldIndex].Name = aFieldName then
    begin
      Result := LFieldIndex;
      Break;
    end;
end;

function TMphTable.ImportSettings(
  const aJSONSettings: TMorphSettings): TMphTable;
begin

end;

function TMphTable.InsertInto(const aTableName: String): TMphTable;
begin

end;

function TMphTable.LoadFromFDMemtable(
  const aMemtable: TFDMemTable): TMphTable;
begin

end;

function TMphTable.LoadFromJSONString(const aJSONString: String): TMphTable;
begin

end;

function TMphTable.NewLine: TMphTable;
var
  LTempField : TMorphField;
begin
  for LTempField in FFields.Elements do
    LTempField.Values.AddEmptyValue;

  Result := Self;
end;

function TMphTable.TypeInteger: TMphTable;
begin
  FFields.Add(TMorphField.New.SetName(FCurrentFieldName).SetFieldType(mphInteger));
  Result := Self;
end;

function TMphTable.TypeString: TMphTable;
begin
  FFields.Add(TMorphField.New.SetName(FCurrentFieldName).SetFieldType(mphVarchar));
  Result := Self;
end;

{ TMphTableArrange }

function TMphTableArrange.ExportSettings: TMorphSettings;
begin

end;

function TMphTableArrange.ImportSettings(
  const aJSONSettings: TMorphSettings): TMphTableArrange;
begin

end;

function TMphTableArrange.Name(const aTableName: String): TMphTable;
begin

end;

end.
