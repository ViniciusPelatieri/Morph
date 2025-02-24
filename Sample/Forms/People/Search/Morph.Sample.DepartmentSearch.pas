unit Morph.Sample.DepartmentSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Menus;

type
  TFrmDepartmentSearch = class(TForm)
    PnBase: TPanel;
    PnSearchFilters: TPanel;
    LbEdtGlobalSearch: TLabeledEdit;
    BtnShowHideFilters: TButton;
    Obs: TLabeledEdit;
    LbEdtID: TLabeledEdit;
    LbEdtName: TLabeledEdit;
    DGGridDepartments: TDBGrid;
    Menu: TMainMenu;
    MenuNewDepartment: TMenuItem;
    procedure MenuNewDepartmentClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDepartmentSearch: TFrmDepartmentSearch;

implementation

uses
  Morph.LogoShow;

{$R *.dfm}

procedure TFrmDepartmentSearch.MenuNewDepartmentClick(Sender: TObject);
begin
  FrmLogo.NewDepartment;
end;

end.
