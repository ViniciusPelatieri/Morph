unit Morph.Sample.PeopleInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.Imaging.pngimage;

type
  TFrmPeopleInfo = class(TForm)
    PnBase: TPanel;
    LbEdtID: TLabeledEdit;
    LbEdtName: TLabeledEdit;
    ImgProfilePicture: TImage;
    LbEdtPhone: TLabeledEdit;
    BtnSave: TButton;
    BtnEdit: TButton;
    Menu: TMainMenu;
    MenuRegistrationType: TMenuItem;
    MenuAddress: TMenuItem;
    MenuStatus: TMenuItem;
    CbCountry: TComboBox;
    LbSocialNumber: TLabeledEdit;
    LbEdtCreditLimit: TLabeledEdit;
    CbStatus: TComboBox;
    LbEdtStatus: TLabel;
    CbRegistrationType: TComboBox;
    LbRegistrationType: TLabel;
    CbNumber: TComboBox;
    LbNumber: TLabel;
    CbStreet: TComboBox;
    LbStrteet: TLabel;
    CbDistrict: TComboBox;
    LbDistrict: TLabel;
    CbCity: TComboBox;
    LbCity: TLabel;
    CbState: TComboBox;
    LbState: TLabel;
    CbPostalCode: TComboBox;
    LbPostalCode: TLabel;
    LbCountry: TLabel;
    PnSellerInfo: TPanel;
    LbEdtComission: TLabeledEdit;
    LbDepartment: TLabel;
    CbDepartment: TComboBox;
    MenuDepartment: TMenuItem;
    procedure MenuRegistrationTypeClick(Sender: TObject);
    procedure MenuAddressClick(Sender: TObject);
    procedure MenuStatusClick(Sender: TObject);
    procedure MenuDepartmentClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowSellerInfo(const anAction: Boolean);
  public
    { Public declarations }
    procedure EditClient(const aClientID: Integer);
    procedure NewClient;
    procedure EditSeller(const aSelerID: Integer);
    procedure NewSeller;
  end;

var
  FrmPeopleInfo: TFrmPeopleInfo;

implementation

{$R *.dfm}

uses Morph.LogoShow;

{ TFrm_PeopletInfo }

procedure TFrmPeopleInfo.EditClient(const aClientID: Integer);
begin
  Self.Caption := 'Client Edit';
  ShowSellerInfo(False);
end;

procedure TFrmPeopleInfo.EditSeller(const aSelerID: Integer);
begin
  Self.Caption := 'Seller Edit';
  ShowSellerInfo(True);
end;

procedure TFrmPeopleInfo.MenuAddressClick(Sender: TObject);
begin
  FrmLogo.AddressSearchShow;
end;

procedure TFrmPeopleInfo.MenuDepartmentClick(Sender: TObject);
begin
  FrmLogo.DepartmentSearchShow;
end;

procedure TFrmPeopleInfo.MenuRegistrationTypeClick(Sender: TObject);
begin
  FrmLogo.RegistrationTypeSearchShow;
end;

procedure TFrmPeopleInfo.MenuStatusClick(Sender: TObject);
begin
  FrmLogo.RegisterStatusSearchShow;
end;

procedure TFrmPeopleInfo.NewClient;
begin
  Self.Caption := 'New Client';
  ShowSellerInfo(False);
end;

procedure TFrmPeopleInfo.NewSeller;
begin
  Self.Caption := 'New Seller';
  ShowSellerInfo(True);
end;

procedure TFrmPeopleInfo.ShowSellerInfo(const anAction: Boolean);
begin
  PnSellerInfo.Visible := anAction;
  Menu.Items.Find('Department').Visible := anAction;
end;

end.
