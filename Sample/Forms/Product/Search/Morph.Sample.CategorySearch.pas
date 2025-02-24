unit Morph.Sample.CategorySearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.Menus;

type
  TFrmCategorySearch = class(TForm)
    PnBase: TPanel;
    PnSearchFilters: TPanel;
    LbEdtGlobalSearch: TLabeledEdit;
    BtnShowHideFilters: TButton;
    DGGridCategories: TDBGrid;
    Obs: TLabeledEdit;
    LbEdtID: TLabeledEdit;
    LbEdtName: TLabeledEdit;
    Menu: TMainMenu;
    MenuNewCategory: TMenuItem;
    procedure MenuNewCategoryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCategorySearch: TFrmCategorySearch;

implementation

uses
  Morph.LogoShow;

{$R *.dfm}

procedure TFrmCategorySearch.MenuNewCategoryClick(
  Sender: TObject);
begin
  FrmLogo.NewCategory;
end;

end.
