unit Morph.Sample.ProductSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TFrmProductSearch = class(TForm)
    PnBase: TPanel;
    PnProdSearch: TPanel;
    PnGridProducts: TPanel;
    DBGridProducts: TDBGrid;
    BtnShowHideFilters: TButton;
    LbEdtGlobalSearch: TLabeledEdit;
    LbEdtCode: TLabeledEdit;
    LbEdtName: TLabeledEdit;
    LbEdtPrice: TLabeledEdit;
    LbEdtQtd: TLabeledEdit;
    LbCategory: TLabel;
    CbCategory: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProductSearch: TFrmProductSearch;

implementation

{$R *.dfm}


end.
