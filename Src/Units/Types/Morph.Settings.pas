unit Morph.Settings;

interface

uses
  Morph.EnumeratedTypes, FireDAC.Comp.Client;

type
  TMorphSettings = class
    private
      const
        CQueryLifeTime = 60000;
        CWaitTimeBeforeCheckIfQueryIsInUse = 100;
        CWaitTimeBeforeCheckIfQueryLifeTimeIsOver = 10000;
      var
        FConnection: TFDConnection;
        FDBType: TMorphDBType;
        FIgnoreCreatedStructure: Boolean;
    public
      class function New: TMorphSettings;
      class function QueryLifeTime: Integer;
      class function WaitTimeBeforeCheckIfQueryIsInUse: Integer;
      class function WaitTimeBeforeCheckIfQueryLifeTimeIsOver: Integer;
      destructor Destroy; override;
      function Clone: TMorphSettings;

      function IgnoreCreatedStructure(const AAction: Boolean): TMorphSettings; overload;
      function IgnoreCreatedStructure: TMorphSettings; overload;
      function Connection(const AFDConnection: TFDConnection): TMorphSettings; overload;
      function Connection: TFDConnection; overload;
      function DatabaseType(const ADBType: TMorphDBType): TMorphSettings; overload;
      function DatabaseType: TMorphDBType; overload;
  end;

implementation

{ TMorphSettings }



{ TMorphSettings }

function TMorphSettings.Clone: TMorphSettings;
begin
  Result := Self.New
              .Connection(FConnection)
              .DatabaseType(FDBType)
              .IgnoreCreatedStructure(FIgnoreCreatedStructure);
end;

function TMorphSettings.Connection(
  const AFDConnection: TFDConnection): TMorphSettings;
begin
  FConnection := AFDConnection;
  Result := Self;
end;

function TMorphSettings.Connection: TFDConnection;
begin
  Result := FConnection;
end;

function TMorphSettings.DatabaseType(
  const ADBType: TMorphDBType): TMorphSettings;
begin
  FDBType := ADBType;
  Result := Self;
end;

function TMorphSettings.DatabaseType: TMorphDBType;
begin
  Result := FDBType;
end;

destructor TMorphSettings.Destroy;
begin
  if Assigned(FConnection) then
    FConnection.Free;
  inherited;
end;

function TMorphSettings.IgnoreCreatedStructure(
  const AAction: Boolean): TMorphSettings;
begin
  FIgnoreCreatedStructure := AAction;
  Result := Self;
end;

function TMorphSettings.IgnoreCreatedStructure: TMorphSettings;
begin
  FIgnoreCreatedStructure := True;
  Result := Self;
end;

class function TMorphSettings.New: TMorphSettings;
begin
  Result := TMorphSettings.Create;
end;

class function TMorphSettings.QueryLifeTime: Integer;
begin
  Result := CQueryLifeTime;
end;

class function TMorphSettings.WaitTimeBeforeCheckIfQueryIsInUse: Integer;
begin
  Result := CWaitTimeBeforeCheckIfQueryIsInUse;
end;

class function TMorphSettings.WaitTimeBeforeCheckIfQueryLifeTimeIsOver: Integer;
begin
  Result := CWaitTimeBeforeCheckIfQueryLifeTimeIsOver;
end;

end.
