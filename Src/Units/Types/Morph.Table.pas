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
      FCurrendFieldName : String;
      function RegisteredField(const aFieldName : String) : Boolean;
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
      function Post : TMorphField;
      function AsValue(const aValue : TValue) : TMphTable;

      //overloaded
      function SetField(const aFieldID : Integer): TMphTable; overload;
      function SetField(const aFieldName : String): TMphTable; overload;

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
  if RegisteredField(aFieldName) then
    Raise Exception.Create(Format(MORPH_MESSAGE_FIELD_DUPLICATE, [aFieldName]));

  FCurrendFieldName := aFieldName;
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
  FFields.CurrentField.AddValue(aValue);
  Result := Self;
end;

procedure TMphTable.Clear;
begin
  FName := '';
  FCurrendFieldName := '';

  if Assigned(FFields) then
    FFields.Clear;
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

function TMphTable.FieldByName(const aFieldName: String): TMphTable;
begin

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
begin

end;

function TMphTable.Post: TMorphField;
begin

end;

function TMphTable.RegisteredField(const aFieldName: String): Boolean;
begin
  Result := False;
  FFields.First;
  while NOT FFields.Eof do
  begin
    if FFields.CurrentField.Name = aFieldName then
    begin
      Result := True;
      Exit;
    end;
    FFields.Next;
  end;
end;

function TMphTable.SetField(const aFieldName: String): TMphTable;
begin

end;

function TMphTable.SetField(const aFieldID: Integer): TMphTable;
begin
  FFields.RecNo := aFieldID;
  Result := Self;
end;

function TMphTable.TypeInteger: TMphTable;
begin
  FFields.Add(TMorphField.New.SetName(FCurrendFieldName).SetFieldType(mphInteger));
  Result := Self;
end;

function TMphTable.TypeString: TMphTable;
begin
  FFields.Add(TMorphField.New.SetName(FCurrendFieldName).SetFieldType(mphVarchar));
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
