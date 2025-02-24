unit Morph.Sample.RegisterStatusSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.Menus;

type
  TFrmRegisterStatusSearch = class(TForm)
    PnBase: TPanel;
    PnSearchFilters: TPanel;
    LbEdtGlobalSearch: TLabeledEdit;
    BtnShowHideFilters: TButton;
    DGGridRegisterStatus: TDBGrid;
    Obs: TLabeledEdit;
    LbEdtID: TLabeledEdit;
    LbEdtName: TLabeledEdit;
    PnSpecificity: TPanel;
    LbSpecificity: TLabel;
    ChkBxCanBeUsed: TCheckBox;
    Menu: TMainMenu;
    MenuNewRegistrationStatus: TMenuItem;
    procedure MenuNewRegistrationStatusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegisterStatusSearch: TFrmRegisterStatusSearch;

implementation

uses
  Morph.LogoShow;

{$R *.dfm}

procedure TFrmRegisterStatusSearch.MenuNewRegistrationStatusClick(
  Sender: TObject);
begin
  FrmLogo.NewRegistrationStatus;
end;

end.
