unit Morph.Sample.OrderStatusSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.Menus;

type
  TFrmOrderStatusSearch = class(TForm)
    PnBase: TPanel;
    PnSearchFilters: TPanel;
    LbEdtGlobalSearch: TLabeledEdit;
    BtnShowHideFilters: TButton;
    Obs: TLabeledEdit;
    LbEdtID: TLabeledEdit;
    LbEdtName: TLabeledEdit;
    PnSpecificity: TPanel;
    LbSpecificity: TLabel;
    ChkBxStockEntry: TCheckBox;
    DGGridOrderStatus: TDBGrid;
    ChkBxStockRemoval: TCheckBox;
    Menu: TMainMenu;
    MenuNewOrderStatus: TMenuItem;
    procedure MenuNewOrderStatusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOrderStatusSearch: TFrmOrderStatusSearch;

implementation

uses
  Morph.LogoShow;

{$R *.dfm}

procedure TFrmOrderStatusSearch.MenuNewOrderStatusClick(Sender: TObject);
begin
  FrmLogo.NewOrderStatus;
end;

end.
