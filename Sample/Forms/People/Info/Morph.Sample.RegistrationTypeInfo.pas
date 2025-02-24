unit Morph.Sample.RegistrationTypeInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TFrmRegistrationTypeInfo = class(TForm)
    PnBase: TPanel;
    LbEdtID: TLabeledEdit;
    LbEdtName: TLabeledEdit;
    Obs: TLabeledEdit;
    PnSpecificity: TPanel;
    LbSpecificity: TLabel;
    ChkBxSellProducts: TCheckBox;
    BtnEdit: TButton;
    BtnSave: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Edit(const aRegistrationTypeID: Integer);
    procedure NewRegister;
  end;

var
  FrmRegistrationTypeInfo: TFrmRegistrationTypeInfo;

implementation

{$R *.dfm}

{ TFrmRegistrationTypeInfo }

procedure TFrmRegistrationTypeInfo.Edit(const aRegistrationTypeID: Integer);
begin
  Self.Caption := 'Edit Registration Type';
end;

procedure TFrmRegistrationTypeInfo.NewRegister;
begin
  Self.Caption := 'New Registration Type';
end;

end.
