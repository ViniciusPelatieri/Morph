unit Morph.DataSetUtilitys;

interface

uses
  Data.DB, Datasnap.DBClient, FireDAC.Comp.Client;

type
  TMorphDSUtls = class
    public
      class procedure DataSetToClientDS(ADataSet: TDataSet; AClientDataSet: TClientDataSet);
      class procedure FDQryToClientDS(aFDQuery : TFDQuery; AClientDataSet: TClientDataSet);
      class procedure FDQryToFDMemtable(aFDQuery : TFDQuery; aFDMemTable : TFDMemtable);
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

  AFDMemTable.Close;  // Garante que o MemTable está fechado
  AFDMemTable.CopyDataSet(AFDQuery, [coStructure, coRestart, coAppend]);  // Copia estrutura e dados
  AFDMemTable.Open;
end;

end.
