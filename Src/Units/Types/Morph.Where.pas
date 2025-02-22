//TMorphSQLOperations = (msoField, msoEquals, msoDiffers, msoIsBiggerThan, msoIsSmallerThan, msoOr, msoAnd);
unit Morph.Where;

interface

uses
  System.Rtti, Morph.EnumeratedTypes, Morph.Vector;

type
  W = record
    private
      FOperations: TMorphVector<TMorphSQLOperations>;
      FParameters: TMorphVector<TValue>;
    public
      procedure Init;
      procedure Free;

      class operator Implicit(const aName: String): W;
      function Equals(const aValue : TValue): W;
      function DiffersFrom(const aValue : TValue): W;
      function IsBiggerThan(const aValue : TValue): W;
      function IsSmallerThen(const aValue : TValue): W;
      function _Or: W;
      function _And: W;

      property Operations: TMorphVector<TMorphSQLOperations> read FOperations;
      property Parameters: TMorphVector<TValue> read FParameters;
  end;

implementation

{ W }

function W.DiffersFrom(const aValue: TValue): W;
begin
  FOperations.Add(msoDiffers);
  FParameters.Add(aValue);
  Result := Self;
end;

function W.Equals(const aValue: TValue): W;
begin
  FOperations.Add(msoEquals);
  FParameters.Add(aValue);
  Result := Self;
end;

procedure W.Free;
begin
  FOperations.Free;
  FParameters.Free;
end;

class operator W.Implicit(const aName: String): W;
begin
  Result.Init;
end;

procedure W.Init;
begin
  FOperations := TMorphVector<TMorphSQLOperations>.Create;
  FParameters := TMorphVector<TValue>.Create;
end;

function W.IsBiggerThan(const aValue: TValue): W;
begin
  FOperations.Add(msoIsBiggerThan);
  FParameters.Add(aValue);
  Result := Self;
end;

function W.IsSmallerThen(const aValue: TValue): W;
begin
  FOperations.Add(msoIsSmallerThan);
  FParameters.Add(aValue);
  Result := Self;
end;

function W._And: W;
begin
  FOperations.Add(msoAnd);
  Result := Self;
end;

function W._Or: W;
begin
  FOperations.Add(msoOr);
  Result := Self;
end;

end.
