program Morph.Sample.Project;

uses
  Vcl.Forms,
  Morph.Sample in 'Forms\Morph.Sample.pas' {Sample};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSample, Sample);
  Application.Run;
end.
