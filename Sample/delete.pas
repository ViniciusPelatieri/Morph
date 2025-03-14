unit delete;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
   Morph.SQLExecutor, Morph.EnumeratedTypes;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  LMorphSQLExecutor: TMorphSQLExecutor;
begin
  LMorphSQLExecutor := TMorphSQLExecutor.Create;
  LMorphSQLExecutor.RunSQL(Edit1.Text, mqaExecute);

end;

end.
