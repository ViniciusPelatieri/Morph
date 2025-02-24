unit Morph.Sample.PeopleSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Morph, Vcl.Menus;

type
  TSeachType = (stClient, stSeller);

  TFrmPeopleSearch = class(TForm)
    PnBase: TPanel;
    PnCliSearch: TPanel;
    PnGridClients: TPanel;
    DBGridClients: TDBGrid;
    BtnShowHideFilters: TButton;
    LbEdtGlobalSearch: TLabeledEdit;
    LbEdtCode: TLabeledEdit;
    LbEdtName: TLabeledEdit;
    LbEdtPhone: TLabeledEdit;
    LbSocialNumber: TLabeledEdit;
    CbCountry: TComboBox;
    LbCountry: TLabel;
    LbEdtCreditLimit: TLabeledEdit;
    LbEdtStatus: TLabel;
    CbStatus: TComboBox;
    LbRegistrationType: TLabel;
    CbRegistrationType: TComboBox;
    LbPostalCode: TLabel;
    CbPostalCode: TComboBox;
    LbState: TLabel;
    CbState: TComboBox;
    LbCity: TLabel;
    CbCity: TComboBox;
    LbDistrict: TLabel;
    CbDistrict: TComboBox;
    LbStrteet: TLabel;
    CbStreet: TComboBox;
    LbNumber: TLabel;
    CbNumber: TComboBox;
    Menu: TMainMenu;
    MenuNewRegister: TMenuItem;
    MenuAddress: TMenuItem;
    MenuStatus: TMenuItem;
    MenuRegistrationType: TMenuItem;
    PnSellerInfo: TPanel;
    LbDepartment: TLabel;
    LbEdtComission: TLabeledEdit;
    CbDepartment: TComboBox;
    MenuDepartment: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuNewRegisterClick(Sender: TObject);
    procedure MenuRegistrationTypeClick(Sender: TObject);
    procedure MenuStatusClick(Sender: TObject);
    procedure MenuDepartmentClick(Sender: TObject);
  private
    { Private declarations }
    Morph: TMorph;
    FSearchType:  TSeachType;
    procedure ShowSellerInfo(const anAction: Boolean);
  public
    { Public declarations }
    procedure SearchForSellers;
    procedure SearchForClients;
  end;

var
  FrmPeopleSearch: TFrmPeopleSearch;

implementation

uses
  Morph.LogoShow;

{$R *.dfm}


{ TFrmPeopleSearch }

procedure TFrmPeopleSearch.FormCreate(Sender: TObject);
begin
  Morph := TMorph.Create;
  Morph.Select.All.From('CLIENT');
end;

procedure TFrmPeopleSearch.FormDestroy(Sender: TObject);
begin
  Morph.Free;
end;

procedure TFrmPeopleSearch.MenuDepartmentClick(Sender: TObject);
begin
  FrmLogo.DepartmentSearchShow;
end;

procedure TFrmPeopleSearch.MenuNewRegisterClick(Sender: TObject);
begin
  case FSearchType of
    stClient: FrmLogo.NewClient;
    stSeller: FrmLogo.NewSeller;
  end;
end;

procedure TFrmPeopleSearch.MenuRegistrationTypeClick(Sender: TObject);
begin
  FrmLogo.RegistrationTypeSearchShow;
end;

procedure TFrmPeopleSearch.MenuStatusClick(Sender: TObject);
begin
  FrmLogo.RegisterStatusSearchShow;
end;

procedure TFrmPeopleSearch.SearchForClients;
begin
  Self.Caption := 'Clients Search';
  FSearchType := stClient;
  ShowSellerInfo(False);
end;

procedure TFrmPeopleSearch.SearchForSellers;
begin
  Self.Caption := 'Sellers Search';
  FSearchType := stSeller;
  ShowSellerInfo(True);
end;

procedure TFrmPeopleSearch.ShowSellerInfo(const anAction: Boolean);
begin
  PnSellerInfo.Visible := anAction;
  Menu.Items.Find('Department').Visible := anAction;
end;

end.
