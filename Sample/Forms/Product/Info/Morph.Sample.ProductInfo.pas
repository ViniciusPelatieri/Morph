unit Morph.Sample.ProductInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.Imaging.pngimage;

type
  TFrmProductInfo = class(TForm)
    PnBase: TPanel;
    LbEdtID: TLabeledEdit;
    LbEdtDescription: TLabeledEdit;
    ImgProduct: TImage;
    LbEdtPrice: TLabeledEdit;
    LbEdtMaxDiscount: TLabeledEdit;
    LbEdtAvaliableQtd: TLabeledEdit;
    LbEdtMinimumStockQtd: TLabeledEdit;
    LbEdtMinSellQtd: TLabeledEdit;
    LbEdtMaxSellQtd: TLabeledEdit;
    LbCategory: TLabel;
    CbCategory: TComboBox;
    Menu: TMainMenu;
    MenuCategories: TMenuItem;
    BtnSave: TButton;
    BtnEdit: TButton;
    procedure MenuCategoriesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Edit(const aProductID: Integer);
    procedure NewRegister;
  end;

var
  FrmProductInfo: TFrmProductInfo;

implementation

uses
  Morph.LogoShow;

{$R *.dfm}

{ TFrmProductInfo }

procedure TFrmProductInfo.Edit(const aProductID: Integer);
begin
  Self.Caption := 'Edit Product';
end;

procedure TFrmProductInfo.MenuCategoriesClick(Sender: TObject);
begin
  FrmLogo.CategoriesSearch;
end;

procedure TFrmProductInfo.NewRegister;
begin
  Self.Caption := 'New Product';
end;

end.
