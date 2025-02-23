program Morph.Sample.Project;

uses
  Vcl.Forms,
  Firedac.DApt,
  Morph.Sample in 'Forms\Morph.Sample.pas' {Sample},
  Morph.Frame.Where in 'Frames\Morph.Frame.Where.pas' {FrameWhere: TFrame},
  Morph.Sample.PDV in 'Forms\Morph.Sample.PDV.pas' {FrmPdv},
  Morph.Sample.PeopleSearch in 'Forms\Morph.Sample.PeopleSearch.pas' {FrmPeopleSearch},
  Morph.Sample.ProductSearch in 'Forms\Morph.Sample.ProductSearch.pas' {FrmProductSearch},
  Morph.LogoShow in 'Forms\Morph.LogoShow.pas' {FrmLogo},
  Morph.Sample.OrdersSearch in 'Forms\Morph.Sample.OrdersSearch.pas' {FrmOrdersSearch};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogo, FrmLogo);
  Application.CreateForm(TFrmOrdersSearch, FrmOrdersSearch);
  Application.Run;
end.
