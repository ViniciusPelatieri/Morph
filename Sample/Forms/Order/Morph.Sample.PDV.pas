unit Morph.Sample.PDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ActnMenus, Vcl.Menus, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Imaging.pngimage, Morph.Sample.ProductSearch;

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
    procedure MenuSellersClick(Sender: TObject);
    procedure MenuProductsClick(Sender: TObject);
    procedure MenuOrdersClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuClientsClick(Sender: TObject);
    procedure MenuReportsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPdv: TFrmPdv;

implementation

uses
  Morph.Sample.PeopleSearch, Morph.LogoShow;

{$R *.dfm}


procedure TFrmPdv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmLogo.Close;
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

procedure TFrmPdv.MenuProductsClick(Sender: TObject);
begin
  FrmLogo.ProductsSeachShow;
end;

procedure TFrmPdv.MenuReportsClick(Sender: TObject);
begin
  FrmLogo.ReportsShow;
end;

end.
