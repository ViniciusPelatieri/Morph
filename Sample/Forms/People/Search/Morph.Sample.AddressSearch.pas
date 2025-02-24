unit Morph.Sample.AddressSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.Menus;

type
  TFrmAddresstSearch = class(TForm)
    PnBase: TPanel;
    PnAddressSearch: TPanel;
    PnGridAddresses: TPanel;
    DBGridAddresses: TDBGrid;
    BtnShowHideFilters: TButton;
    LbEdtGlobalSearch: TLabeledEdit;
    Menu: TMainMenu;
    MenuNewAddress: TMenuItem;
    CbCountry: TComboBox;
    CbPostalCode: TComboBox;
    LbPostalCode: TLabel;
    LbCountry: TLabel;
    CbState: TComboBox;
    LbState: TLabel;
    CbCity: TComboBox;
    LbCity: TLabel;
    CbDistrict: TComboBox;
    LbDistrict: TLabel;
    CbStreet: TComboBox;
    LbStrteet: TLabel;
    CbNumber: TComboBox;
    LbNumber: TLabel;
    procedure MenuNewAddressClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAddresstSearch: TFrmAddresstSearch;

implementation

uses
  Morph.LogoShow;

{$R *.dfm}

procedure TFrmAddresstSearch.MenuNewAddressClick(Sender: TObject);
begin
  FrmLogo.NewAddress;
end;

end.
