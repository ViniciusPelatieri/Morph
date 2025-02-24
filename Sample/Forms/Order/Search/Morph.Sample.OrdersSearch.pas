unit Morph.Sample.OrdersSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Menus;

type
  TFrmOrdersSearch = class(TForm)
    PnBase: TPanel;
    PnOrdersSearch: TPanel;
    PnGridOrders: TPanel;
    DBGridOrders: TDBGrid;
    BtnShowHideFilters: TButton;
    LbEdtGlobalClientSearch: TLabeledEdit;
    LbEdtGlobalSellerSearch: TLabeledEdit;
    LbEdtGlobalOrderSearch: TLabeledEdit;
    LbEdtGlobalSearch: TLabeledEdit;
    LbEdtClientID: TLabeledEdit;
    LbEdtSellerID: TLabeledEdit;
    LbEdtClientName: TLabeledEdit;
    LbEdtSellerName: TLabeledEdit;
    LbEdtGlobalProductSearch: TLabeledEdit;
    LbEdtProductID: TLabeledEdit;
    LbEdtOrderID: TLabeledEdit;
    LbEdtProductName: TLabeledEdit;
    DateTimePicker1: TDateTimePicker;
    LbOrderDate: TLabel;
    LbOrderStatus: TLabel;
    CbOrderStatus: TComboBox;
    Menu: TMainMenu;
    MenuStatus: TMenuItem;
    MeuPaymentMethod: TMenuItem;
    procedure MenuStatusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOrdersSearch: TFrmOrdersSearch;

implementation

uses
  Morph.LogoShow;

{$R *.dfm}

procedure TFrmOrdersSearch.MenuStatusClick(Sender: TObject);
begin
  FrmLogo.OrderStatusSearch;
end;

end.
