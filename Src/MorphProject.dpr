program MorphProject;

uses
  System.StartUpCopy,
  FMX.Forms,
  FireDac.DApt,
  Morph in 'Units\Morph.pas',
  Morph.EnumeratedTypes in 'Units\Types\Morph.EnumeratedTypes.pas',
  Morph.MorphTable in 'Units\Types\Morph.MorphTable.pas',
  Morph.Field in 'Units\Types\Morph.Field.pas',
  Morph.Settings in 'Units\Types\Morph.Settings.pas',
  Motph.Filter in 'Units\Types\Motph.Filter.pas',
  Morph.Vector in 'Units\Types\Morph.Vector.pas',
  Morph.PSQL.Structure.FB5 in 'Units\PSQL\Morph.PSQL.Structure.FB5.pas',
  Morph.PSQL.Structure.Common in 'Units\PSQL\Morph.PSQL.Structure.Common.pas',
  Morph.DataSetUtilitys in 'Units\Helpers\Morph.DataSetUtilitys.pas',
  Morph.PSQL.Structure.FB2_5 in 'Units\PSQL\Morph.PSQL.Structure.FB2_5.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Run;
end.
