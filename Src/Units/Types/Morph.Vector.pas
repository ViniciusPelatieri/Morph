unit Morph.Vector;

interface

uses
  System.Rtti, System.SysUtils, System.Generics.Collections;

type
  TMorphVector<T> = class
  private
    FArray: TArray<T>;
    FArrayGUID: TArray<String>;
    FRecNo: Integer;
    FCurrentGUID: String;
    FGUIDsAndIndexes: TDictionary<String, Integer>;
    function NewGUID: String;
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
    procedure SetIndexByGUID(const AGUID: String);
    procedure Add(const anElement : T);
    procedure SetCurrentElement(const aValue: T);

    class function New : TMorphVector<T>;
    function Current : T;
    function Eof : Boolean;
    function Count : Integer;
    function GetRecNo : Integer;
    function CurrentGUID: String;
    function GetElements : TArray<T>;
    function Clone : TMorphVector<T>;
    function SetRecNo(const aValue: Integer): TMorphVector<T>;
    function SetCurrentGUID(const AValue: String): TMorphVector<T>;
    function SetElements(const anArray: TArray<T>): TMorphVector<T>;
    function SetGUIDS(const AArray: TArray<String>): TMorphVector<T>;
    function SetIDsAndIndexesDictionary(const ADictionary: TDictionary<String, Integer>): TMorphVector<T>;

    property GUIDS: TArray<String> read FArrayGUID; //read only
    property RecNo : Integer read FRecNo write FRecNo;
    property Elements: TArray<T> read FArray write FArray;
  end;

implementation

{ TMorphVector<T> }

procedure TMorphVector<T>.Add(const anElement: T);
begin
  SetLength(FArray, Length(FArray) + 1);
  FArray[Length(FArray) - 1] := anElement;
  FRecNo := High(FArray);

  SetLength(FArrayGUID, Length(FArrayGUID) + 1);
  FArrayGUID[Length(FArrayGUID) - 1] := NewGUID;
  FCurrentGUID := FArrayGUID[Length(FArrayGUID) - 1];

  FGUIDsAndIndexes.Add(FArrayGUID[Length(FArrayGUID) - 1], High(FArray));
end;

procedure TMorphVector<T>.AddEmptyValue;
var
  LTempGUID: String;
begin
  SetLength(FArray, Length(FArray) + 1);
  FRecNo := High(FArray);

  SetLength(FArrayGUID, Length(FArrayGUID) + 1);
  LTempGUID := NewGUID;
  FArrayGUID[Length(FArrayGUID) -1] := LTempGUID;
  FCurrentGUID := LTempGUID;

  FGUIDsAndIndexes.Add(LTempGUID, High(FArray));
end;

procedure TMorphVector<T>.Clear;
begin
  SetLength(FArray, 0);
  SetLength(FArrayGUID, 0);
  FGUIDsAndIndexes.Clear;

  FRecNo := -1;
  FCurrentGUID := '';
end;

function TMorphVector<T>.Clone: TMorphVector<T>;
begin
  Result := TMorphVector<T>.New
    .SetElements(Copy(FArray, 0, Length(FArray)))
    .SetRecNo(FRecNo)
    .SetGUIDS(FArrayGUID)
    .SetCurrentGUID(FCurrentGUID)
    .SetIDsAndIndexesDictionary(FGUIDsAndIndexes);
end;

constructor TMorphVector<T>.Create;
begin
  FGUIDsAndIndexes := TDictionary<String, Integer>.Create;
  Clear;
end;

function TMorphVector<T>.Current: T;
begin
  Result := FArray[FRecNo];
end;

function TMorphVector<T>.CurrentGUID: String;
begin
  Result := FCurrentGUID;
end;

procedure TMorphVector<T>.Delete;
var
  AuxComponentArray : TArray<T>;
  AuxIDsArray: TArray<String>;
  I : Integer;
begin
  SetLength(AuxComponentArray, 0);
  SetLength(AuxIDsArray, 0);
  for I := 0 to High(FArray) do
  begin
    if I <> FRecNo then
    begin
      SetLength(AuxComponentArray, Length(AuxComponentArray) + 1);
      AuxComponentArray[Length(AuxComponentArray) - 1] := FArray[I];

      SetLength(AuxIDsArray, Length(AuxIDsArray) + 1);
      AuxIDsArray[Length(AuxIDsArray) - 1] := FArrayGUID[I];
    end
    else
      FGUIDsAndIndexes.Remove(FArrayGUID[I]);
  end;

  FRecNo := FRecNo - 1;
  if FRecNo < 0 then
  begin
    FRecNo := -1;
    FCurrentGUID := '';
  end
  else
    FCurrentGUID := FArrayGUID[FRecNo];

  FArray := AuxComponentArray;
  FArrayGUID := AuxIDsArray;
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
  begin
    FRecNo := 0;
    FCurrentGUID := FArrayGUID[0];
    Exit;
  end;
  FRecNo := -1;
  FCurrentGUID := '';
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
  FCurrentGUID := FArrayGUID[FRecNo];
end;

class function TMorphVector<T>.New: TMorphVector<T>;
begin
  Result := TMorphVector<T>.Create;
end;

function TMorphVector<T>.NewGUID: String;
var
  MyGUID: TGUID;
begin
  if CreateGUID(MyGUID) = 0 then
  begin
    Result := GUIDToString(MyGUID);
    Exit;
  end;

  Raise Exception.Create('Could not create GUID to array item.')
end;

procedure TMorphVector<T>.Next;
begin
  Inc(FRecNo, 1);
  FCurrentGUID := FArrayGUID[FRecNo];
end;

procedure TMorphVector<T>.Previous;
begin
  Dec(FRecNo, 1);
  FCurrentGUID := FArrayGUID[FRecNo];
end;

procedure TMorphVector<T>.SetCurrentElement(const aValue: T);
begin
  FArray[FRecNo] := aValue;
  FCurrentGUID := FArrayGUID[FRecNo];
end;

function TMorphVector<T>.SetCurrentGUID(const AValue: String): TMorphVector<T>;
begin
  FCurrentGUID := AValue;
  Result := Self;
end;

function TMorphVector<T>.SetElements(const anArray: TArray<T>): TMorphVector<T>;
begin
  FArray := anArray;
  Result := Self;
end;

function TMorphVector<T>.SetGUIDS(
  const AArray: TArray<String>): TMorphVector<T>;
begin
  FArrayGUID := AArray;
  Result := Self;
end;

function TMorphVector<T>.SetIDsAndIndexesDictionary(
  const ADictionary: TDictionary<String, Integer>): TMorphVector<T>;
begin
  FGUIDsAndIndexes := ADictionary;
  Result := Self;
end;

procedure TMorphVector<T>.SetIndexByGUID(const AGUID: String);
var
  LIndex: Integer;
begin
  if NOT FGUIDsAndIndexes.TryGetValue(AGUID, LIndex) then
    Raise Exception.Create('This GUID is not contained by this vector.');

  FRecNo := LIndex;
  FCurrentGUID := FArrayGUID[LIndex];
end;

function TMorphVector<T>.SetRecNo(const aValue: Integer): TMorphVector<T>;
begin
  FRecNo := aValue;
  Result := Self;
end;

end.

