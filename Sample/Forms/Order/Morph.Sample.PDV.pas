unit Morph.Sample.PDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ActnMenus, Vcl.Menus, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Imaging.pngimage, Morph.Sample.ProductSearch,
  Morph.Sample.ProductButton, Morph.Vector;

type
  TFrmPdv = class(TForm)
    Menu: TMainMenu;
    MenuClients: TMenuItem;
    MenuSellers: TMenuItem;
    MenuOrders: TMenuItem;
    PnBase: TPanel;
    MenuReports: TMenuItem;
    MenuProducts: TMenuItem;
    PnProducts: TPanel;
    PnItemsList: TPanel;
    PnCategories: TPanel;
    BtnCancelar: TButton;
    BtnPay: TButton;
    ScrlBxProducts: TScrollBox;
    GridPnProducts: TGridPanel;
    Button1: TButton;
    procedure MenuSellersClick(Sender: TObject);
    procedure MenuProductsClick(Sender: TObject);
    procedure MenuOrdersClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuClientsClick(Sender: TObject);
    procedure MenuReportsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FProductButtons: TArray<TTFrameProductButton>;

    procedure AddProductToGrid(const AProductID: Integer);
    procedure ClearGrid;
    procedure ProductClicked(AProductID: Integer);
    function AddButtonToArray(const AProductID: Integer): Integer;
  public
    { Public declarations }
  end;

var
  FrmPdv: TFrmPdv;

implementation

uses
  Morph.Sample.PeopleSearch, Morph.LogoShow;

{$R *.dfm}

function TFrmPdv.AddButtonToArray(const AProductID: Integer): Integer;
var
  LImageBytes: TBytes;
  LShortName: String;
  LPrice: Extended;
begin
  SetLength(FProductButtons, Length(FProductButtons) +1);
  FProductButtons[Length(FProductButtons) -1] := TTFrameProductButton.New(Self)
                                                  .CallBack(ProductClicked)
                                                  .ProductID(AProductID);

      {                                //continuar aqui
frame.SetImage(PNGToBytes('C:\Fonte_Compartilhado\Morph\Sample\Media\Png\Laptop.png'))
     .SetName('teste')
     .SetPrice(12);
end;
                  }
end;

procedure TFrmPdv.AddProductToGrid(const AProductID: Integer);
var
  Linha, Coluna: Integer;
  teste: TArray<TTFrameProductButton>;
  i: Integer;
  CurrentButtonIndex: Integer;
begin
 // CurrentButtonIndex := AddButtonToArray();
  SetLength(teste, 2);
  for i := 1 to Length(teste) do
  begin

    if (I mod 6) = 0 then
    begin
      GridPnProducts.Height := GridPnProducts.Height + 218;
      GridPnProducts.RowCollection.Add;
    end;

    teste[i -1] := TTFrameProductButton.Create(Self);
    teste[i -1].Width := 160;
    teste[i -1].Height := 218;
    teste[i -1].Parent := GridPnProducts;
    teste[i -1].Name := 'a' + IntToStr(i);

    Linha := (i -1) div 5;
    Coluna := (i -1) mod 5;

    if Linha >= GridPnProducts.RowCollection.Count then
      GridPnProducts.RowCollection.Add;

    GridPnProducts.ControlCollection.AddControl(teste[i -1], Coluna, Linha);
  end;
end;


procedure TFrmPdv.Button1Click(Sender: TObject);
begin
  AddProductToGrid(0);
  AddProductToGrid(1);
  AddProductToGrid(2);
end;

procedure TFrmPdv.ClearGrid;
begin

end;

procedure TFrmPdv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmLogo.Close;
end;

procedure TFrmPdv.FormCreate(Sender: TObject);
begin
  SetLength(FProductButtons, 0);
end;

procedure TFrmPdv.FormDestroy(Sender: TObject);
begin
  SetLength(FProductButtons, 0);
end;

procedure TFrmPdv.MenuClientsClick(Sender: TObject);
begin
  FrmLogo.ClientsSearchShow;
end;

procedure TFrmPdv.MenuOrdersClick(Sender: TObject);
begin
  FrmLogo.OrdersSearchShow;
end;

procedure TFrmPdv.MenuSellersClick(Sender: TObject);
begin
  FrmLogo.SellersSearchShow;
end;

procedure TFrmPdv.ProductClicked(AProductID: Integer);
begin

end;

{
var
  PNG: TPngImage;
  Stream: TMemoryStream;
begin
  PNG := TPngImage.Create;
  Stream := TMemoryStream.Create;
  try
    PNG.LoadFromFile(FileName);
    PNG.SaveToStream(Stream);
    SetLength(Result, Stream.Size);
    Stream.Position := 0;
    Stream.ReadBuffer(Result[0], Stream.Size);
  finally
    PNG.Free;
    Stream.Free;
  end;
end;
}

procedure TFrmPdv.MenuProductsClick(Sender: TObject);
begin
  FrmLogo.ProductsSeachShow;
end;

procedure TFrmPdv.MenuReportsClick(Sender: TObject);
begin
  FrmLogo.ReportsShow;
end;

end.
