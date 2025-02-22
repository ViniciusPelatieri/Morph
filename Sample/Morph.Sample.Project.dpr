program Morph.Sample.Project;

uses
  Vcl.Forms,
  Firedac.DApt,
  Morph.Sample in 'Forms\Morph.Sample.pas' {Sample},
  Morph.Frame.Where in 'Frames\Morph.Frame.Where.pas' {FrameWhere: TFrame},
  Morph.Sample.PDV in 'Forms\Morph.Sample.PDV.pas' {FrmPdv};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPdv, FrmPdv);
  Application.Run;
end.
