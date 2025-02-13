program Morph.Sample.Project;

uses
  Vcl.Forms,
  Firedac.DApt,
  Morph.Sample in 'Forms\Morph.Sample.pas' {Sample};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSample, Sample);
  Application.Run;
end.
