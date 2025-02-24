unit Morph.Sample.OrderStatusInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TFrmOrderStatusInfo = class(TForm)
    PnBase: TPanel;
    Obs: TLabeledEdit;
    LbEdtID: TLabeledEdit;
    LbEdtName: TLabeledEdit;
    PnSpecificity: TPanel;
    LbSpecificity: TLabel;
    ChkBxStockEntry: TCheckBox;
    ChkBxStockRemoval: TCheckBox;
    BtnEdit: TButton;
    BtnSave: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOrderStatusInfo: TFrmOrderStatusInfo;

implementation

{$R *.dfm}

end.
