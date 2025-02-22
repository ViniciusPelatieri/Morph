unit Morph.Sample.PDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ActnMenus, Vcl.Menus, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Imaging.pngimage;

type
  TFrmPdv = class(TForm)
    Menu: TMainMenu;
    MenuFile: TMenuItem;
    MenuSellers: TMenuItem;
    MenuOrders: TMenuItem;
    PnBase: TPanel;
    PnClient: TPanel;
    PnProduct: TPanel;
    LbClient: TLabel;
    LbEdtProductCode: TLabeledEdit;
    BtnAddProduct: TButton;
    LbEdtProductName: TLabeledEdit;
    LbEdtQtd: TLabeledEdit;
    LbEdtDiscount: TLabeledEdit;
    MenuReports: TMenuItem;
    LbEdtPrice: TLabeledEdit;
    BtnFinishOrder: TButton;
    PnProductsGrid: TPanel;
    DbGridProducts: TDBGrid;
    BtnRemoveProduct: TButton;
    BtnCancelOrder: TButton;
    ImgClientPic: TImage;
    MenuPaymentMethods: TMenuItem;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPdv: TFrmPdv;

implementation

{$R *.dfm}

end.
