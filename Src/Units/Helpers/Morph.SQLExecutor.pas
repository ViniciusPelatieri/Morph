unit Morph.SQLExecutor;

interface

uses
  FireDAC.Comp.Client, System.Generics.Collections, Morph.Vector,
  Morph.EnumeratedTypes, Morph.Table, System.Threading, System.Classes;

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
      FSelfDestroyThread: ITask;
    public
      class function New: TMorphTempQuery;
      constructor Create;
      destructor Destroy; override;
      procedure KillSelfDestructionThread;
      function Connection(const AConnection: TFDConnection): TMorphTempQuery;
      function SelfDestroyAfter(const AMilisseconds: Integer): TMorphTempQuery;
      function DestroyCallBack(const ACallBackProcedure: TProcedureWithStrParam): TMorphTempQuery;

      property Query: TFDQuery read FQuery;
      property InUse: Boolean read FInUse write FInUse;
  end;

  TMorphSQLExecutor = class
    private
      FConnection: TFDConnection;
      FQryArray: TMorphVector<TMorphTempQuery>;
      procedure ClearQueryArray;
      function GetAvaliableQuery: TMorphTempQuery;
      function CreateNewQuery(const AIsTheFirstOne: Boolean): TMorphTempQuery;
    public
      constructor Create;
      destructor Destroy; override;
      class function New(const AConnection: TFDConnection): TMorphSQLExecutor;
      procedure DestroyQuery(AQueryUUID: String);
      function Connection(const AConnection: TFDConnection): TMorphSQLExecutor;
      function RunSQL(const ACommand : String; const aQryAction : TMorphQryAction): TMphTable;
  end;

implementation

uses
  System.SysUtils, Morph.Settings, DateUtils, Morph.DataBaseUtilities,
  FireDAC.Stan.Option, Morph.Messages;

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
  FQuery.FetchOptions.Mode := fmAll;
end;

destructor TMorphTempQuery.Destroy;
begin
  KillSelfDestructionThread;

  if Assigned(FConnection) then
    FConnection.Free;

  FQuery.Free;

  FDeleteFromArray(FQueryID);
  inherited;
end;

function TMorphTempQuery.DestroyCallBack(
  const ACallBackProcedure: TProcedureWithStrParam): TMorphTempQuery;
begin
  FDeleteFromArray := ACallBackProcedure;
  Result := Self;
end;

procedure TMorphTempQuery.KillSelfDestructionThread;
begin
  if Assigned(FSelfDestroyThread) then
  begin
    FSelfDestroyThread.Cancel;
    FSelfDestroyThread := Nil;
  end;
end;

class function TMorphTempQuery.New: TMorphTempQuery;
begin
  Result := TMorphTempQuery.Create;
end;

function TMorphTempQuery.SelfDestroyAfter(const AMilisseconds: Integer): TMorphTempQuery;
begin
  FSelfDestroyAfter := AMilisseconds;
  KillSelfDestructionThread;
  FSelfDestroyThread := TTask.Run(
  procedure
  begin
    while True do
    begin
      if MilliSecondsBetween(Now, FLastUsed) > FSelfDestroyAfter then
      begin
        while (FInUse) do
          Sleep(TMorphSettings.WaitTimeBeforeCheckIfQueryIsInUse);

        FDeleteFromArray(FQueryID);
        Break;
      end;

      Sleep(TMorphSettings.WaitTimeBeforeCheckIfQueryLifeTimeIsOver);
    end;
  end);

  Result := Self;
end;

{ TMorphSQLExecutor }

procedure TMorphSQLExecutor.ClearQueryArray;
var
  LQuery: TMorphTempQuery;
begin
  for LQuery in FQryArray.Elements do
  begin
    if Assigned(LQuery) then
      LQuery.Free;
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
  FQryArray := TMorphVector<TMorphTempQuery>.Create;
  CreateNewQuery(True);
end;

function TMorphSQLExecutor.CreateNewQuery(const AIsTheFirstOne: Boolean): TMorphTempQuery;
begin
  if AIsTheFirstOne then
  begin
    FQryArray.Add(TMorphTempQuery.New
                    .Connection(TMorphFireDacUtilities.Clone(FConnection))
                    .DestroyCallBack(DestroyQuery));
    Exit;
  end;
  FQryArray.Add(TMorphTempQuery.New
                    .Connection(TMorphFireDacUtilities.Clone(FConnection))
                    .SelfDestroyAfter(TMorphSettings.QueryLifeTime)
                    .DestroyCallBack(DestroyQuery));

  Result := FQryArray.Current;
end;

destructor TMorphSQLExecutor.Destroy;
begin
  ClearQueryArray;
  FQryArray.Free;
  inherited;
end;

procedure TMorphSQLExecutor.DestroyQuery(AQueryUUID: String);
begin
  if FQryArray.SetIndexByGUID(AQueryUUID) > -1 then
  begin
    FQryArray.Current.Free;
    FQryArray.Delete;
  end;
end;

function TMorphSQLExecutor.GetAvaliableQuery: TMorphTempQuery;
var
  LAvaliableQueryFound: Boolean;
begin
  LAvaliableQueryFound := False;
  FQryArray.First;
  while NOT FQryArray.Eof do
  begin
    if NOT FQryArray.Current.InUse then
    begin
      Result := FQryArray.Current;
      FQryArray.Current.InUse := False;
      Result := FQryArray.Current;
      LAvaliableQueryFound := True;
      Break;
    end;
    FQryArray.Next;
  end;

  if LAvaliableQueryFound then
    Exit;

  Result := CreateNewQuery(False);
end;

class function TMorphSQLExecutor.New(const AConnection: TFDConnection): TMorphSQLExecutor;
begin
  Result := TMorphSQLExecutor.Create;
  Result.Connection(AConnection);
end;

function TMorphSQLExecutor.RunSQL(const ACommand: String;
  const aQryAction: TMorphQryAction): TMphTable;
var
  LTempQuery : TMorphTempQuery;
begin
  LTempQuery := GetAvaliableQuery;
  LTempQuery.Query.SQL.Text := ACommand;
  try
    case aQryAction of
      mqaOpen: LTempQuery.Query.Open;
      mqaExecute: LTempQuery.Query.ExecSQL;
    end;
  except on E : Exception do
    Raise Exception.Create(Format(MORPH_MESSAGE_PSQL_EXCEPTION, [aCommand, E.Message]));
  end;
end;

end.
