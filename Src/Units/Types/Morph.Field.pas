unit Morph.Field;

interface

uses
  Morph.Vector, Morph.EnumeratedTypes, System.Rtti;
type
  TMorphTableFieldInfo = class
    private
    public
  end;

  TMorphTableFieldsInfo = class
    private
    public
  end;

  TMorphField = class
    private
      FName : String;
      FType : TMorphFieldTypes;
      FSize : Integer;
      FPrimaryKey : Boolean;
      FForeignKey : Boolean;
      FNotNull : Boolean;
      FUnique : Boolean;
      FReferencedTable : String;
      FReferencedField : String;
      FNoOrphanData : Boolean;
      FIdentity : Boolean;
      FFKName : String;
      FRelationsBehavior : TMorphRelationsbehavior;
      FValues : TMorphVector<TValue>;
    public
      constructor Create;
      destructor Destroy;
      class function New : TMorphField;
      function SetName(const aFieldName : String) : TMorphField;
      function SetFieldType(const aFieldType: TMorphFieldTypes) : TMorphField;
      function AddValue(const aValue : TValue) : TMorphField;
      property Name : String read FName write FName;
      property FieldType : TMorphFieldTypes read FType write FType;
      property PrimaryKey : Boolean read FPrimaryKey write FPrimaryKey;
      property ForeignKey : Boolean read FForeignKey write FForeignKey;
      property NotNull : Boolean read FNotNull write FNotNull;
      property Unique : Boolean read FUnique write FUnique;
      property ReferencedTable : String read FReferencedTable write FReferencedTable;
      property ReferencedField : String read FReferencedField write FReferencedField;
      property NoOrphaData : Boolean read FNoOrphanData write FNoOrphanData;
      property Size : Integer read FSize write FSize;
      property Identity : Boolean read FIdentity write FIdentity;
      property FKName : String read FFKName write FFKName;
      property RelationsBehavior : TMorphRelationsbehavior read FRelationsBehavior write FRelationsBehavior;
      property Values : TMorphVector<TValue> read FValues write FValues;
  end;

  TMorphFields = class(TMorphVector<TMorphField>)
  private
  public
      function Count : Integer;{ElementsCount}
      function CurrentField : TMorphField;{CurrentElement}
      procedure Clear; {ClearVector}

      property Fields : TArray<TMorphField> read GetElements write SetElements;
  end;
implementation

{ TMorphFields }

procedure TMorphFields.Clear;
begin
  inherited ClearVector;
end;

function TMorphFields.CurrentField: TMorphField;
begin
  Result := inherited CurrentElement;
end;

function TMorphFields.Count: Integer;
begin
  Result := inherited ElementsCount;
end;

{ TMorphField }

function TMorphField.AddValue(const aValue: TValue): TMorphField;
begin
  FValues.Add(aValue);
  Result := Self;
end;

constructor TMorphField.Create;
begin
  FValues := TMorphVector<TValue>.Create;
  FPrimaryKey := False;
  FForeignKey := False;
  FNotNull := False;
  FUnique := False;
  FNoOrphanData := False;
  FIdentity := False;
  FSize := 0;
end;

destructor TMorphField.Destroy;
begin
  FValues.Free;
end;

class function TMorphField.New: TMorphField;
begin
  Result := TMorphField.Create;
end;

function TMorphField.SetFieldType(
  const aFieldType: TMorphFieldTypes): TMorphField;
begin
  FType := aFieldType;
  Result := Self;
end;

function TMorphField.SetName(const aFieldName: String): TMorphField;
begin
  FName := aFieldName;
  Result := Self;
end;

end.
