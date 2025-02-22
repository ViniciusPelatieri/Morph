program MorphProject;

uses
  System.StartUpCopy,
  FMX.Forms,
  FireDac.DApt,
  Morph in 'Units\Morph.pas',
  Morph.EnumeratedTypes in 'Units\Types\Morph.EnumeratedTypes.pas',
  Morph.Table in 'Units\Types\Morph.Table.pas',
  Morph.Field in 'Units\Types\Morph.Field.pas',
  Morph.Settings in 'Units\Types\Morph.Settings.pas',
  Morph.Filter in 'Units\Types\Morph.Filter.pas',
  Morph.Vector in 'Units\Types\Morph.Vector.pas',
  Morph.PSQL.Structure.FB5 in 'Units\PSQL\Morph.PSQL.Structure.FB5.pas',
  Morph.PSQL.Structure.Common in 'Units\PSQL\Morph.PSQL.Structure.Common.pas',
  Morph.DataSetUtilitys in 'Units\Helpers\Morph.DataSetUtilitys.pas',
  Morph.PSQL.Structure.FB2_5 in 'Units\PSQL\Morph.PSQL.Structure.FB2_5.pas',
  Morph.Messages in 'Units\Morph.Messages.pas',
  Morph.Where in 'Units\Types\Morph.Where.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Run;
end.
