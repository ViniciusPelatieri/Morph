unit Morph.TableField;

interface

uses
  Morph.Vector;
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
    public
  end;

  TMorphFields = class(TMorphVector<TMorphField>)
  private
  public
      function Count : Integer;{ElementsCount}
      function CurrentField : TMorphField;{CurrentElement}
      procedure Clear; {ClearVector}

      property Fields : TArray<TMorphField> read GetElements write SetElements;
      property RecNo : Integer read GetRecNo write SetRecNo;

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

end.
