unit Morph.Field;

interface

uses
  Morph.Vector, Morph.EnumeratedTypes;
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
    public
      constructor Create;
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

constructor TMorphField.Create;
begin
  FPrimaryKey := False;
  FForeignKey := False;
  FNotNull := False;
  FUnique := False;
  FNoOrphanData := False;
  FIdentity := False;
  FSize := 0;
end;

end.
