unit Morph.Sample.MorphInit;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, Morph;

type
  TDMMorphInit = class(TDataModule)
    FDCModelo: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FMorph: TMorph;
    procedure CreateDBStructure;
  public
    { Public declarations }
  end;

var
  DMMorphInit: TDMMorphInit;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMMorphInit.CreateDBStructure;
begin
  FMorph.IgnoreCreatedStructure;

  FMorph.Table('CATEGORIES')
          .Field('ID').tInteger.PrimaryKey.NotNull
          .Field('NAME').tVarchar(15).NotNull
          .Field('OBS').tVarchar(300).NotNull
        .CreateTable;

  FMorph.Table('CLIENTS')
          .Field('ID').tInteger.PrimaryKey.NotNull
          .Field('DESCRIPTION').tVarchar(100).NotNull
          .Field('SHORT_NAME').tVarchar(18).NotNull
          .Field('AVALIABLE_QTD').tFloat
          .Field('MIN_STOCK_QTD').tFloat
          .Field('MIN_SELL_QTD').tFloat
          .Field('MAX_SELL_QTD').tFloat
          .Field('PRICE').tFloat
          .Field('MAX_DISCOUNT').tFloat
          .Field('CATEGORY').tFloat.ForeignKey.References.Table('CATEGORIES').Field('ID').FKName('FK_CLIENTS_CATEGORIES').NoOrphanData
        .CreateTable;
end;

procedure TDMMorphInit.DataModuleCreate(Sender: TObject);
begin
  FMorph := TMorph.Create;
  CreateDBStructure;
end;

procedure TDMMorphInit.DataModuleDestroy(Sender: TObject);
begin
  FMorph.Free;
end;

end.
