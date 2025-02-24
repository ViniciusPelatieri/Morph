unit Morph.Sample.ProductSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.Menus;

type
  TFrmProductSearch = class(TForm)
    PnBase: TPanel;
    PnProdSearch: TPanel;
    PnGridProducts: TPanel;
    DBGridProducts: TDBGrid;
    BtnShowHideFilters: TButton;
    LbEdtGlobalSearch: TLabeledEdit;
    LbEdtCode: TLabeledEdit;
    LbEdtName: TLabeledEdit;
    LbEdtPrice: TLabeledEdit;
    LbEdtQtd: TLabeledEdit;
    LbCategory: TLabel;
    CbCategory: TComboBox;
    Menu: TMainMenu;
    MenuNewRegister: TMenuItem;
    MenuCategories: TMenuItem;
    procedure MenuNewRegisterClick(Sender: TObject);
    procedure MenuCategoriesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProductSearch: TFrmProductSearch;

implementation

uses
  Morph.LogoShow;

{$R *.dfm}

procedure TFrmProductSearch.MenuCategoriesClick(Sender: TObject);
begin
  FrmLogo.CategoriesSearch;
end;

procedure TFrmProductSearch.MenuNewRegisterClick(Sender: TObject);
begin
  FrmLogo.NewProductShow;
end;

end.
