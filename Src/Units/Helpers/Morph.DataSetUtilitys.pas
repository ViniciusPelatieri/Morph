unit Morph.DataSetUtilitys;

interface

uses
  Data.DB, Datasnap.DBClient, FireDAC.Comp.Client, Morph.EnumeratedTypes;

type
  TMorphDSUtls = class
    public
      class procedure DataSetToClientDS(ADataSet: TDataSet; AClientDataSet: TClientDataSet);
      class procedure FDQryToClientDS(aFDQuery : TFDQuery; AClientDataSet: TClientDataSet);
      class procedure FDQryToFDMemtable(aFDQuery : TFDQuery; aFDMemTable : TFDMemtable);
      class function  UsrDateToDBDate(const aStringDate: String; const anEntryOrientation: TMorphDateOrientation) : String;
  end;

implementation

uses
  System.Classes, FireDAC.Stan.Intf, FireDAC.Comp.DataSet, Datasnap.Provider;

{ TMorphDSUtls }

class procedure TMorphDSUtls.DataSetToClientDS(ADataSet: TDataSet;
  AClientDataSet: TClientDataSet);
var
  Stream: TMemoryStream;
begin
  if not Assigned(ADataSet) or not Assigned(AClientDataSet) then
    Exit;

  Stream := TMemoryStream.Create;
  try
    ADataSet.DisableControls;
    try
      (ADataSet as TCustomClientDataSet).SaveToStream(Stream);
      Stream.Position := 0;
      AClientDataSet.Close;
      AClientDataSet.LoadFromStream(Stream);
      AClientDataSet.Open;
    finally
      ADataSet.EnableControls;
    end;
  finally
    Stream.Free;
  end;
end;

class procedure TMorphDSUtls.FDQryToClientDS(aFDQuery: TFDQuery;
  AClientDataSet: TClientDataSet);
var
  Provider: TDataSetProvider;
begin
  if not Assigned(AFDQuery) or not Assigned(AClientDataSet) then
    Exit;

  AClientDataSet.Close;

  Provider := TDataSetProvider.Create(nil);
  try
    Provider.DataSet := AFDQuery;
    AClientDataSet.SetProvider(Provider);
    AClientDataSet.Open;
  finally
    Provider.Free;
  end;
end;

class procedure TMorphDSUtls.FDQryToFDMemtable(aFDQuery: TFDQuery;
  aFDMemTable: TFDMemtable);
begin
  if not Assigned(AFDQuery) or not Assigned(AFDMemTable) then
    Exit;

  AFDMemTable.Close;
  AFDMemTable.CopyDataSet(AFDQuery, [coStructure, coRestart, coAppend]);
  aFDMemTable.Open;
end;

class function TMorphDSUtls.UsrDateToDBDate(const aStringDate: String;
  const anEntryOrientation: TMorphDateOrientation): String;
begin
  case anEntryOrientation of
    mdoDD_MM_AAAA: Result := Copy(aStringDate, 7, 4)+'/'+
                             Copy(aStringDate, 4, 2)+'/'+
                             Copy(aStringDate, 0, 2);

    mdoMM_DD_AAAA: Result := Copy(aStringDate, 7, 4)+'/'+
                             Copy(aStringDate, 0, 2)+'/'+
                             Copy(aStringDate, 4, 2);

    mdoAAAA_MM_DD: Result := aStringDate;
  end;
end;

end.
