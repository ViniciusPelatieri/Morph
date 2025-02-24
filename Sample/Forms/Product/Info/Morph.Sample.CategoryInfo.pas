unit Morph.Sample.CategoryInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.Imaging.pngimage;

type
  TFrmcategoryInfo = class(TForm)
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
    procedure Edit(const aProductID: Integer);
    procedure NewRegister;
  end;

var
  FrmcategoryInfo: TFrmcategoryInfo;

implementation

{$R *.dfm}

{ TFrmProductInfo }

procedure TFrmcategoryInfo.Edit(const aProductID: Integer);
begin
  Self.Caption := 'Category Edit';
end;

procedure TFrmcategoryInfo.NewRegister;
begin
  Self.Caption := 'New Category';
end;

end.
