unit Morph.Sample.PeopleSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchForSellers;
    procedure SearchForClients;
  end;

var
  FrmPeopleSearch: TFrmPeopleSearch;

implementation

{$R *.dfm}


{ TFrmPeopleSearch }

procedure TFrmPeopleSearch.SearchForClients;
begin
  Self.Caption := 'Clients Search';
end;

procedure TFrmPeopleSearch.SearchForSellers;
begin
  Self.Caption := 'Sellers Search';
end;

end.
