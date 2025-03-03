unit Morph.Sample.MorphInit;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, Morph,
  Morph.Settings;

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
    function GetConnection: TFDConnection;
    function GetMorphConfig: TMorphSettings;
  end;

var
  DMMorphInit: TDMMorphInit;

implementation

uses Morph.EnumeratedTypes;

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

  FMorph.Table('PICTURE_CATEGORIES')
          .Field('ID').tInteger.PrimaryKey.NotNull
          .Field('DESCRIPTION').tVarchar(50).NotNull
        .CreateTable;

  FMorph.Table('PICTURES')
          .Field('ID').tInteger.PrimaryKey.NotNull
          .Field('CONTENT').tBinaryBlob.NotNull
          .Field('CATEGORY').tInteger.NotNull.ForeignKey.References.Table('PICTURE_CATEGORIES').Field('ID').FKName('FK_PICTURES_PICTURE_CATEGORIES').NoOrphanData
        .CreateTable;

  FMorph.Table('PRODUCTS')
          .Field('ID').tInteger.PrimaryKey.NotNull
          .Field('DESCRIPTION').tVarchar(100).NotNull
          .Field('SHORT_NAME').tVarchar(18).NotNull
          .Field('AVALIABLE_QTD').tFloat
          .Field('MIN_STOCK_QTD').tFloat
          .Field('MIN_SELL_QTD').tFloat
          .Field('MAX_SELL_QTD').tFloat
          .Field('PRICE').tFloat.NotNull
          .Field('MAX_DISCOUNT').tFloat
          .Field('PICTURE_ID').tInteger.NotNull.ForeignKey.References.Table('PICTURES').Field('ID').FKName('FK_PRODUCTS_PICTURES').NoOrphanData
          .Field('CATEGORY_ID').tInteger.NotNull.ForeignKey.References.Table('CATEGORIES').Field('ID').FKName('FK_PRODUCTS_CATEGORIES').NoOrphanData
        .CreateTable;
end;

procedure TDMMorphInit.DataModuleCreate(Sender: TObject);
begin
  FMorph := TMorph.New
          .Connection(FDCModelo)
          .DatabaseType(FB5);

  CreateDBStructure;
end;

procedure TDMMorphInit.DataModuleDestroy(Sender: TObject);
begin
  FMorph.Free;
end;

function TDMMorphInit.GetConnection: TFDConnection;
begin
  Result := FDCModelo;
end;

function TDMMorphInit.GetMorphConfig: TMorphSettings;
begin
  Result := FMorph.CloneSettings;
end;

end.
