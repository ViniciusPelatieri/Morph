unit Morph.Field;

interface

uses
  Morph.Vector, Morph.EnumeratedTypes, System.Rtti;
type
  TMorphField = class
    private
      FName,
      FFKName,
      FReferencedTable,
      FReferencedField : String;

      FUnique,
      FNotNull,
      FIdentity,
      FPrimaryKey,
      FForeignKey,
      FNoOrphanData : Boolean;

      FSize : Integer;
      FType : TMorphFieldTypes;
      FValues : TMorphVector<TValue>;
      FRelationsBehavior : TMorphRelationsbehavior;

      function SetFKName(const aFKName: String) : TMorphField; //clone
      function SetSize(const aSize: Integer) : TMorphField; //clone
      function SetNotNull(const IsNotNull: Boolean) : TMorphField; //clone
      function SetIdentity(const IsIdentity: Boolean) : TMorphField; //clone
      function SetType(const aType: TMorphFieldTypes) : TMorphField; //clone
      function SetUnique(const IsUnique: Boolean) : TMorphField; //clone
      function SetPrimaryKey(const IsPrimaryKey: Boolean) : TMorphField; //clone
      function SetForeignKey(const IsForeignKey: Boolean) : TMorphField; //clone
      function SetNoOrphanData(const IsNoOrphanData: Boolean) : TMorphField; //clone
      function SetValues(const aValues: TMorphVector<TValue>) : TMorphField; //clone
      function SetReferencedTable(const aReferencedTable: String) : TMorphField; //clone
      function SetReferencedField(const aReferencedField: String) : TMorphField; //clone
      function SetRelationsBehavior(const aRelationsBehavior: TMorphRelationsbehavior) : TMorphField; //clone
    public
      constructor Create;
      destructor Destroy;

      class function New : TMorphField;
      function Clone : TMorphField;
      function SetName(const aFieldName : String) : TMorphField;
      function AddValue(const aValue : TValue) : TMorphField;
      function SetFieldType(const aFieldType: TMorphFieldTypes) : TMorphField;

      property Name : String read FName write FName;
      property Size : Integer read FSize write FSize;
      property Unique : Boolean read FUnique write FUnique;
      property FKName : String read FFKName write FFKName;
      property NotNull : Boolean read FNotNull write FNotNull;
      property Identity : Boolean read FIdentity write FIdentity;
      property FieldType : TMorphFieldTypes read FType write FType;
      property PrimaryKey : Boolean read FPrimaryKey write FPrimaryKey;
      property ForeignKey : Boolean read FForeignKey write FForeignKey;
      property Values : TMorphVector<TValue> read FValues write FValues;
      property NoOrphaData : Boolean read FNoOrphanData write FNoOrphanData;
      property ReferencedTable : String read FReferencedTable write FReferencedTable;
      property ReferencedField : String read FReferencedField write FReferencedField;
      property RelationsBehavior : TMorphRelationsbehavior read FRelationsBehavior write FRelationsBehavior;
  end;

  TMorphFields = TMorphVector<TMorphField>;

implementation

{ TMorphField }

function TMorphField.AddValue(const aValue: TValue): TMorphField;
begin
  FValues.Add(aValue);
  Result := Self;
end;

function TMorphField.Clone: TMorphField;
begin
  Result := TMorphField.New
    .SetName(FName)
    .SetFKName(FFKName)
    .SetReferencedTable(FReferencedTable)
    .SetReferencedField(FReferencedField)
    .SetUnique(FUnique)
    .SetNotNull(FNotNull)
    .SetIdentity(FIdentity)
    .SetPrimaryKey(FPrimaryKey)
    .SetForeignKey(FForeignKey)
    .SetNoOrphanData(FNoOrphanData)
    .SetSize(FSize)
    .SetType(FType)
    .SetValues(FValues.Clone)
    .SetRelationsBehavior(FRelationsBehavior);
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
  FieldType := mphUndefined;
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

function TMorphField.SetFKName(const aFKName: String): TMorphField; //clone
begin
  FKName := aFKName;
  Result := Self;
end;

function TMorphField.SetForeignKey(const IsForeignKey: Boolean): TMorphField; //clone
begin
  FForeignKey := IsForeignKey;
  Result := Self;
end;

function TMorphField.SetIdentity(const IsIdentity: Boolean): TMorphField; //clone
begin
  FIdentity := IsIdentity;
  Result := Self;
end;

function TMorphField.SetName(const aFieldName: String): TMorphField;
begin
  FName := aFieldName;
  Result := Self;
end;

function TMorphField.SetNoOrphanData(const IsNoOrphanData: Boolean): TMorphField; //clone
begin
  FNoOrphanData := IsNoOrphanData;
  Result := Self;
end;

function TMorphField.SetNotNull(const IsNotNull: Boolean): TMorphField; //clone
begin
  FNotNull := IsNotNull;
  Result := Self;
end;

function TMorphField.SetPrimaryKey(const IsPrimaryKey: Boolean): TMorphField; //clone
begin
  FPrimaryKey := IsPrimaryKey;
  Result := Self;
end;

function TMorphField.SetReferencedField(
  const aReferencedField: String): TMorphField; //clone
begin
  FReferencedField := aReferencedField;
  Result := Self;;
end;

function TMorphField.SetReferencedTable(
  const aReferencedTable: String): TMorphField; //clone
begin
  FReferencedTable := aReferencedTable;
  Result := Self;
end;

function TMorphField.SetRelationsBehavior(const aRelationsBehavior: TMorphRelationsbehavior): TMorphField; //clone
begin
  FRelationsBehavior := aRelationsBehavior;
  Result := Self;
end;

function TMorphField.SetSize(const aSize: Integer): TMorphField; //clone
begin
  FSize := aSize;
  Result := Self;
end;

function TMorphField.SetType(const aType: TMorphFieldTypes): TMorphField; //clone
begin
  FType := aType;
  Result := Self;
end;

function TMorphField.SetUnique(const IsUnique: Boolean): TMorphField; //clone
begin
  FUnique := IsUnique;
  Result := Self;
end;

function TMorphField.SetValues(
  const aValues: TMorphVector<TValue>): TMorphField; //clone
begin
  FValues := aValues;
  Result := Self;
end;

end.
