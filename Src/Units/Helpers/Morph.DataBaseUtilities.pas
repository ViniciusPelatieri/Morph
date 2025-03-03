unit Morph.DataBaseUtilities;

interface

uses
  FireDAC.Comp.Client;

type
  TMorphFireDacUtilities = class
    public
      class function Clone(const AFDConnection: TFDConnection): TFDConnection;
  end;

implementation

{ TMorphFireDacUtilities }

class function TMorphFireDacUtilities.Clone(
  const AFDConnection: TFDConnection): TFDConnection;
begin
  Result := TFDConnection.Create(Nil);
  Result.Params.DriverID := AFDConnection.Params.DriverID;
  Result.Params.Database := AFDConnection.Params.Database;
  Result.Params.UserName := AFDConnection.Params.UserName;
  Result.Params.Password := AFDConnection.Params.Password;
  Result.TxOptions.AutoCommit := True;
  Result.LoginPrompt := False;
  Result.Open;
end;

end.
