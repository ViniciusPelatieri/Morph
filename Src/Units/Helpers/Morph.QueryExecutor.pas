unit Morph.QueryExecutor;

interface

uses
  FireDAC.Comp.Client, System.Generics.Collections, Morph.Vector,
  Morph.EnumeratedTypes, Morph.Table;

type
  TProcedureWithStrParam = procedure(AValue: String) of object;

  TMorphTempQuery = class
    private
      FQueryID: String;
      FQuery: TFDQuery;
      FConnection: TFDConnection;
      FInUse: Boolean;
      FLastUsed: TDateTime;
      FDeleteFromArray: TProcedureWithStrParam;
      FSelfDestroyAfter: Integer;
    public
      class function New: TMorphTempQuery;
      constructor Create;
      destructor Destroy; override;
      function SelfDestroyAfter(const AMilisseconds: Integer): TMorphTempQuery;
      function Connection(const AConnection: TFDConnection): TMorphTempQuery;
      property Query: TFDQuery read FQuery write FQuery;

  end;

  TMorphSQLExecutor = class    //To use FDQuery, check if it is FB5, etc cause mongo does not use fdq
    private
      FQryArray: TMorphVector<TMorphTempQuery>;
      FConnection: TFDConnection;
      procedure CreateNewQuery(const AIsTheFirstOne: Boolean);
      procedure ClearQueryArray;
    public
      constructor Create;
      destructor Destroy; override;
      class function New(const AConnection: TFDConnection): TMorphSQLExecutor;
      function Connection(const AConnection: TFDConnection): TMorphSQLExecutor;
      function RunPSQL(const aCommand : String; const aQryAction : TMorphQryAction): TMorphSQLExecutor;
      function AsFDQuery: TFDQuery;
      function AsMorphTable: TMphTable;
  end;

implementation

uses
  System.SysUtils, Morph.Settings, DateUtils;

{ TMorphTempQuery }

function TMorphTempQuery.Connection(
  const AConnection: TFDConnection): TMorphTempQuery;
begin
  FConnection := AConnection;
  Result := Self;
end;

constructor TMorphTempQuery.Create;
begin
  FQuery := TFDQuery.Create(Nil);
end;

destructor TMorphTempQuery.Destroy;
begin
  if Assigned(FConnection) then
    FConnection.Free;

  FQuery.Free;
  inherited;
end;

class function TMorphTempQuery.New: TMorphTempQuery;
begin
  Result := TMorphTempQuery.Create;
end;

function TMorphTempQuery.SelfDestroyAfter(const AMilisseconds: Integer): TMorphTempQuery;
begin
  FSelfDestroyAfter := AMilisseconds;

  while (FInUse) do
    Sleep(TMorphSettings.WaitTimeBeforeCheckIfQueryIsInUse);

  while True do
  begin
    if MilliSecondsBetween(Now, FLastUsed) > FSelfDestroyAfter then
    begin
      FDeleteFromArray(FQueryID);
      Break;
    end;

    Sleep(TMorphSettings.WaitTimeBeforeCheckIfQueryLifeTimeIsOver);
  end;

  Result := Self;
end;

{ TMorphSQLExecutor }

function TMorphSQLExecutor.AsFDQuery: TFDQuery;
begin

end;

function TMorphSQLExecutor.AsMorphTable: TMphTable;
begin

end;

procedure TMorphSQLExecutor.ClearQueryArray;
var
  LQuery: TMorphTempQuery;
begin
  for LQuery in FQryArray.Elements do
  begin
    if Assigned(LQuery) then
      LQuery.Query.Free;
  end;
  FQryArray.Clear;
end;

function TMorphSQLExecutor.Connection(
  const AConnection: TFDConnection): TMorphSQLExecutor;
begin
  FConnection := AConnection;
  Result := Self;
end;

constructor TMorphSQLExecutor.Create;
begin
  CreateNewQuery(True);
end;

procedure TMorphSQLExecutor.CreateNewQuery(const AIsTheFirstOne: Boolean);
begin
  if AIsTheFirstOne then
  begin
    FQryArray.Add(TMorphTempQuery.New.Connection(TMorphFireDacUtilities.Clone(FConnection));
    Exit;
  end;
  FQryArray.Add(TMorphTempQuery.New.Connection().SelfDestroyAfter(TMorphSettings.QueryLifeTime));
end;

destructor TMorphSQLExecutor.Destroy;
begin
  ClearQueryArray;
  inherited;
end;

class function TMorphSQLExecutor.New(const AConnection: TFDConnection): TMorphSQLExecutor;
begin
  Result := TMorphSQLExecutor.Create;
  Result.Connection(AConnection);
end;

function TMorphSQLExecutor.RunPSQL(const aCommand: String;
  const aQryAction: TMorphQryAction): TMorphSQLExecutor;
begin
  if Assigned(FDQResult) then
    FDQResult.Free;

  if Assigned(FTempConnection) then
    FTempConnection.Free;

  FDQResult := TFDQuery.Create(Nil);
  FTempConnection := TMorphFireDacUtilities.Clone(FSettings.Connection);

  FDQResult.Connection := FTempConnection;
  FDQResult.FetchOptions.Mode := fmAll;
  FDQResult.SQL.Text := aCommand;

  try
    case aQryAction of
      Open: FDQResult.Open;
      Execute: FDQResult.ExecSQL;
    end;
  except on E : Exception do
    Raise Exception.Create(Format(MORPH_MESSAGE_PSQL_EXCEPTION, [aCommand, E.Message]));
  end;
end;

end.
