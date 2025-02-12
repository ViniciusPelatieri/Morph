unit Morph.Vector;

interface

type
  TMorphVector<T> = class
    private
      FArray : TArray<T>;
      FRecNo : Integer;
    public
      procedure Add(const anElement : T);
      function ElementsCount : Integer;
      procedure First;
      procedure Last;
      procedure Next;
      procedure Previous;
      procedure Delete;
      function CurrentElement : T;
      procedure ClearVector;
      function GetElements : TArray<T>;
      procedure SetElements(const anArray : TArray<T>);
      function GetRecNo : Integer;
      procedure SetRecNo(const aValue : Integer);
      function Eof : Boolean;

      property Elements : TArray<T> read FArray write FArray;
      property RecNumbers : Integer read FRecNo write FRecNo;
  end;

implementation

{ TMorphVector<T> }

procedure TMorphVector<T>.Add(const anElement: T);
begin
  SetLength(FArray, Length(FArray) + 1);
  FArray[Length(FArray) -1] := anElement;

  FRecNo := High(FArray);
end;

procedure TMorphVector<T>.ClearVector;
begin
  SetLength(FArray, 0);
end;

function TMorphVector<T>.CurrentElement: T;
begin
  Result := FArray[FRecNo];
end;

procedure TMorphVector<T>.Delete;
var
  AuxArray : TArray<T>;
  I : Integer;
begin
  SetLength(AuxArray, 0);
  for I := 0 to High(AuxArray) do
  begin
    if I <> FRecNo then
    begin
      SetLength(AuxArray, Length(AuxArray) + 1);
      AuxArray[Length(AuxArray) -1] := FArray[I];
    end;
  end;

  FRecNo := FRecNo -1;
  if FRecNo < 0 then
    FRecNo := 0;

  FArray := AuxArray;
end;

function TMorphVector<T>.ElementsCount: Integer;
begin
  Result := Length(FArray);
end;

function TMorphVector<T>.Eof: Boolean;
begin
  Result := (FRecNo = High(FArray));
end;

procedure TMorphVector<T>.First;
begin
  FRecNo := 0;
end;

function TMorphVector<T>.GetElements: TArray<T>;
begin
  Result := FArray;
end;

function TMorphVector<T>.GetRecNo: Integer;
begin
  Result := FRecNo;
end;

procedure TMorphVector<T>.Last;
begin
  FRecNo := High(FArray);
end;

procedure TMorphVector<T>.Next;
begin
  Inc(FRecNo, 1);
end;

procedure TMorphVector<T>.Previous;
begin
  Dec(FRecNo, 1);
end;

procedure TMorphVector<T>.SetElements(const anArray: TArray<T>);
begin
  FArray := anArray;
end;

procedure TMorphVector<T>.SetRecNo(const aValue: Integer);
begin
  FRecNo := aValue;
end;

end.
