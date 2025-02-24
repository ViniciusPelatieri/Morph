unit Morph.Sample.RegistrationType;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Menus,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask;

type
  TFrmRegistrationType = class(TForm)
    PnBase: TPanel;
    PnFilters: TPanel;
    LbEdtGlobalSearch: TLabeledEdit;
    LbEdtID: TLabeledEdit;
    LbEdtName: TLabeledEdit;
    Obs: TLabeledEdit;
    PnSpecificity: TPanel;
    LbSpecificity: TLabel;
    ChkBxSellProducts: TCheckBox;
    PnGrid: TPanel;
    DBGridRegType: TDBGrid;
    Menu: TMainMenu;
    MenuNewRegistrationType: TMenuItem;
    procedure MenuNewRegistrationTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegistrationType: TFrmRegistrationType;

implementation

uses
  Morph.LogoShow;

{$R *.dfm}

procedure TFrmRegistrationType.MenuNewRegistrationTypeClick(Sender: TObject);
begin
  FrmLogo.NewRegistrationType;
end;

end.
