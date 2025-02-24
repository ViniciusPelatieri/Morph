unit Morph.Sample.Reports;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TFrmReports = class(TForm)
    PnBase: TPanel;
    PnChoseReport: TPanel;
    PnReportResult: TPanel;
    DBGridRelat: TDBGrid;
    TabCtrlTipoRelat: TTabControl;
    PnReportConfig: TPanel;
    CbReportType: TComboBox;
    LbReportType: TLabel;
    DateFrom: TDateTimePicker;
    DateTo: TDateTimePicker;
    LbTo: TLabel;
    LbPeriod: TLabel;
    BtnExport: TButton;
  private
    { Private declarations }
  public  
    { Public declarations }
  end;

var
  FrmReports: TFrmReports;

implementation

{$R *.dfm}


end.
