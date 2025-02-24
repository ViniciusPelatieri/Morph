unit Morph.Sample.DepartmentInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TFrmDepartmentInfo = class(TForm)
    PnBase: TPanel;
    Obs: TLabeledEdit;
    LbEdtID: TLabeledEdit;
    LbEdtName: TLabeledEdit;
    BtnEdit: TButton;
    BtnSave: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure NewRegister;
    procedure Edit(const aDepartmentID: Integer);
  end;

var
  FrmDepartmentInfo: TFrmDepartmentInfo;

implementation

{$R *.dfm}

{ TFrmDepartmentIngo }

procedure TFrmDepartmentInfo.Edit(const aDepartmentID: Integer);
begin
  Self.Caption := 'Department Edit';
end;

procedure TFrmDepartmentInfo.NewRegister;
begin
  Self.Caption := 'New Department';
end;

end.
