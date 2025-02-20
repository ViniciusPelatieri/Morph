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

      function SetName(const aName: String): TMphTable; //clone
      function SetFields(const aFields: TMorphFields): TMphTable; //clone
    public
      constructor Create;
      destructor Destroy; override;

      procedure Clear;

      class function New : TMphTable;
      function Clone : TMphTable;
      function NewLine : TMphTable;
      function TypeString : TMphTable;
      function TypeInteger : TMphTable;
      function AsValue(const aValue : TValue) : TMphTable;
      function AddField(const aFieldName : String) : TMphTable;
      function FieldIdByName(const aFieldName : String) : Integer;
      function ContainsField(const aFieldName : String) : Boolean;

      //overloaded
      function Field(const aFieldID : Integer): TMphTable; overload;
      function Field(const aFieldName : String): TMphTable; overload;

      property Name : String read FName write FName;
      property Fields : TMorphFields read FFields write FFields;
  end;

implementation

uses
  System.SysUtils, Morph.Messages;

{ TMphTable }

class function TMphTable.New : TMphTable;
begin
  Result := Self.Create;
end;

function TMphTable.AddField(const aFieldName: String): TMphTable;
begin
  if ContainsField(aFieldName) then
    Raise Exception.Create(Format(MORPH_MESSAGE_FIELD_DUPLICATE, [aFieldName]));

  FFields.Add(TMorphField.New.SetName(aFieldName));
  Result := Self;
end;

function TMphTable.AsValue(const aValue: TValue): TMphTable;
begin
  FFields.Current.Values.SetCurrentElement(aValue);
  Result := Self;
end;

procedure TMphTable.Clear;
begin
  FName := '';
  FFields.Clear;
end;

function TMphTable.Clone: TMphTable;
begin
  Result := TMphTable.New.SetName(FName).SetFields(FFields.Clone);
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

function TMphTable.Field(const aFieldName: String): TMphTable;
var
  LFieldID : Integer;
begin
  LFieldID := FieldIdByName(aFieldName);

  if (LFieldID < 0) OR (LFieldID > High(FFields.Elements)) then
    Raise Exception.Create(Format(MORPH_MESSAGE_FIELD_NOT_FOUND, [aFieldName, FName]));

  FFields.RecNo := LFieldID;
  Result := Self;
end;

function TMphTable.Field(const aFieldID: Integer): TMphTable;
begin
  if (aFieldID < 0) OR (aFieldID > High(FFields.Elements)) then
    Raise Exception.Create(Format(MORPH_MESSAGE_NOT_VALID_FIELD_IDENTIFICATOR, [IntToStr(aFieldID)]));

  FFields.RecNo := aFieldID;
  Result := Self;
end;

function TMphTable.FieldIdByName(const aFieldName: String): Integer;
var
  LFieldIndex : Integer;
begin
  Result := -1;
  for LFieldIndex := 0 to FFields.Count -1 do
    if FFields.Elements[LFieldIndex].Name = aFieldName then
    begin
      Result := LFieldIndex;
      Break;
    end;
end;

function TMphTable.NewLine: TMphTable;
var
  LTempField : TMorphField;
begin
  for LTempField in FFields.Elements do
    LTempField.Values.AddEmptyValue;

  Result := Self;
end;

function TMphTable.SetFields(const aFields: TMorphFields): TMphTable; //clone
begin
  FFields := aFields;
  Result := Self;
end;

function TMphTable.SetName(const aName: String): TMphTable; //clone
begin
  FName := aName;
  Result := Self;
end;

function TMphTable.TypeInteger: TMphTable;
begin
  FFields.Current.FieldType := mphInteger;
  Result := Self;
end;

function TMphTable.TypeString: TMphTable;
begin
  FFields.Current.FieldType := mphVarchar;
  Result := Self;
end;


end.
