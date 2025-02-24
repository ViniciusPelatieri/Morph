unit Morph.Sample.RegisterStatusInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.Imaging.pngimage;

type
  TFrmRegisterStatusInfo = class(TForm)
    PnBase: TPanel;
    Obs: TLabeledEdit;
    LbEdtID: TLabeledEdit;
    LbEdtName: TLabeledEdit;
    PnSpecificity: TPanel;
    LbSpecificity: TLabel;
    ChkBxCanBeUsed: TCheckBox;
    BtnEdit: TButton;
    BtnSave: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Edit(const aProductID: Integer);
    procedure NewRegister;
  end;

var
  FrmRegisterStatusInfo: TFrmRegisterStatusInfo;

implementation

{$R *.dfm}

{ TFrmProductInfo }

procedure TFrmRegisterStatusInfo.Edit(const aProductID: Integer);
begin
  Self.Caption := 'Edit Registration Status';
end;

procedure TFrmRegisterStatusInfo.NewRegister;
begin
  Self.Caption := 'New Registration Status';
end;

end.
