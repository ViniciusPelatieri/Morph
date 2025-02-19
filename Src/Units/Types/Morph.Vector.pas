unit Morph.Vector;

interface

uses
  System.Rtti, Morph.EnumeratedTypes, System.SysUtils, Morph.Messages;

type
  TMorphVector<T> = class
  private
    FArray : TArray<T>;
    FRecNo : Integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Last;
    procedure Next;
    procedure First;
    procedure Delete;
    procedure Previous;
    procedure Clear;
    procedure AddEmptyValue;
    procedure Add(const anElement : T);
    procedure SetCurrentElement(const aValue: T);

    class function New : TMorphVector<T>;
    function Eof : Boolean;
    function Current : T;
    function GetRecNo : Integer;
    function GetElements : TArray<T>;
    function Count : Integer;
    function Clone : TMorphVector<T>;
    function SetRecNo(const aValue: Integer): TMorphVector<T>;
    function SetElements(const anArray: TArray<T>): TMorphVector<T>;

    property Elements: TArray<T> read FArray write FArray;
    property RecNo : Integer read FRecNo write FRecNo;
  end;

implementation

{ TMorphVector<T> }

procedure TMorphVector<T>.Add(const anElement: T);
begin
  SetLength(FArray, Length(FArray) + 1);
  FArray[Length(FArray) - 1] := anElement;
  FRecNo := High(FArray);
end;

procedure TMorphVector<T>.AddEmptyValue;
begin
  SetLength(FArray, Length(FArray) + 1);
  FRecNo := High(FArray);
end;

procedure TMorphVector<T>.Clear;
begin
  if Assigned(FArray) then
    SetLength(FArray, 0);

  FRecNo := -1;
end;

function TMorphVector<T>.Clone: TMorphVector<T>;
begin
  Result := TMorphVector<T>.New.SetElements(Copy(FArray, 0, Length(FArray))).SetRecNo(FRecNo);
end;

constructor TMorphVector<T>.Create;
begin
  Clear;
end;

function TMorphVector<T>.Current: T;
begin
  Result := FArray[FRecNo];
end;

procedure TMorphVector<T>.Delete;
var
  AuxArray : TArray<T>;
  I : Integer;
begin
  SetLength(AuxArray, 0);
  for I := 0 to High(FArray) do
  begin
    if I <> FRecNo then
    begin
      SetLength(AuxArray, Length(AuxArray) + 1);
      AuxArray[Length(AuxArray) - 1] := FArray[I];
    end;
  end;

  FRecNo := FRecNo - 1;
  if FRecNo < 0 then
    FRecNo := 0;

  FArray := AuxArray;
end;

destructor TMorphVector<T>.Destroy;
begin
  Clear;
  inherited;
end;

function TMorphVector<T>.Count: Integer;
begin
  Result := Length(FArray);
end;

function TMorphVector<T>.Eof: Boolean;
begin
  Result := (FRecNo = High(FArray));
end;

procedure TMorphVector<T>.First;
begin
  if Length(FArray) > 0 then
    FRecNo := 0
  else
    FRecNo := -1;
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

class function TMorphVector<T>.New: TMorphVector<T>;
begin
  Result := TMorphVector<T>.Create;
end;

procedure TMorphVector<T>.Next;
begin
  Inc(FRecNo, 1);
end;

procedure TMorphVector<T>.Previous;
begin
  Dec(FRecNo, 1);
end;

procedure TMorphVector<T>.SetCurrentElement(const aValue: T);
begin
  FArray[FRecNo] := aValue;
end;

function TMorphVector<T>.SetElements(const anArray: TArray<T>): TMorphVector<T>;
begin
  FArray := anArray;
  Result := Self;
end;

function TMorphVector<T>.SetRecNo(const aValue: Integer): TMorphVector<T>;
begin
  FRecNo := aValue;
  Result := Self;
end;

end.

