program MorphProject;

uses
  System.StartUpCopy,
  FMX.Forms,
  Morph in 'Units\Morph.pas',
  Morph.EnumeratedTypes in 'Units\Types\Morph.EnumeratedTypes.pas',
  Morph.MorphTable in 'Units\Types\Morph.MorphTable.pas',
  Morph.TableField in 'Units\Types\Morph.TableField.pas',
  Morph.Settings in 'Units\Types\Morph.Settings.pas',
  Motph.Filter in 'Units\Types\Motph.Filter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Run;
end.
