unit Morph.Sample.AddressInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrmAddressInfo = class(TForm)
    PnBase: TPanel;
    LbPostalCode: TLabel;
    LbCountry: TLabel;
    LbState: TLabel;
    LbCity: TLabel;
    LbDistrict: TLabel;
    LbStrteet: TLabel;
    LbNumber: TLabel;
    CbCountry: TComboBox;
    CbPostalCode: TComboBox;
    CbState: TComboBox;
    CbCity: TComboBox;
    CbDistrict: TComboBox;
    CbStreet: TComboBox;
    CbNumber: TComboBox;
    BtnEdit: TButton;
    BtnSave: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure NewRegister;
    procedure Edit(const anAddressID: Integer);
  end;

var
  FrmAddressInfo: TFrmAddressInfo;

implementation

{$R *.dfm}

{ TFrmAddressInfo }

procedure TFrmAddressInfo.Edit(const anAddressID: Integer);
begin
  Self.Caption := 'Address Edit';
end;

procedure TFrmAddressInfo.NewRegister;
begin
  Self.Caption := 'New Address';
end;

end.
