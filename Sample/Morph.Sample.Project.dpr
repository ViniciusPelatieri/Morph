program Morph.Sample.Project;

uses
  Vcl.Forms,
  Firedac.DApt,
  Morph.Sample.OrdersSearch in 'Forms\Order\Search\Morph.Sample.OrdersSearch.pas' {FrmOrdersSearch},
  Morph.Sample.PDV in 'Forms\Order\Morph.Sample.PDV.pas' {FrmPdv},
  Morph.Sample.AddressInfo in 'Forms\People\Info\Morph.Sample.AddressInfo.pas' {FrmAddressInfo},
  Morph.Sample.DepartmentInfo in 'Forms\People\Info\Morph.Sample.DepartmentInfo.pas' {FrmDepartmentInfo},
  Morph.Sample.PeopleInfo in 'Forms\People\Info\Morph.Sample.PeopleInfo.pas' {FrmPeopleInfo},
  Morph.Sample.RegisterStatusInfo in 'Forms\People\Info\Morph.Sample.RegisterStatusInfo.pas' {FrmRegisterStatusInfo},
  Morph.Sample.RegistrationTypeInfo in 'Forms\People\Info\Morph.Sample.RegistrationTypeInfo.pas' {FrmRegistrationTypeInfo},
  Morph.Sample.AddressSearch in 'Forms\People\Search\Morph.Sample.AddressSearch.pas' {FrmAddresstSearch},
  Morph.Sample.DepartmentSearch in 'Forms\People\Search\Morph.Sample.DepartmentSearch.pas' {FrmDepartmentSearch},
  Morph.Sample.PeopleSearch in 'Forms\People\Search\Morph.Sample.PeopleSearch.pas' {FrmPeopleSearch},
  Morph.Sample.RegisterStatusSearch in 'Forms\People\Search\Morph.Sample.RegisterStatusSearch.pas' {FrmRegisterStatusSearch},
  Morph.Sample.RegistrationType in 'Forms\People\Search\Morph.Sample.RegistrationType.pas' {FrmRegistrationType},
  Morph.Sample.CategoryInfo in 'Forms\Product\Info\Morph.Sample.CategoryInfo.pas' {FrmcategoryInfo},
  Morph.Sample.ProductInfo in 'Forms\Product\Info\Morph.Sample.ProductInfo.pas' {FrmProductInfo},
  Morph.Sample.CategorySearch in 'Forms\Product\Search\Morph.Sample.CategorySearch.pas' {FrmCategorySearch},
  Morph.Sample.ProductSearch in 'Forms\Product\Search\Morph.Sample.ProductSearch.pas' {FrmProductSearch},
  Morph.Sample.Reports in 'Forms\Report\Morph.Sample.Reports.pas' {FrmReports},
  Morph.LogoShow in 'Forms\Morph.LogoShow.pas' {FrmLogo},
  Morph.Sample.OrderStatusSearch in 'Forms\Order\Search\Morph.Sample.OrderStatusSearch.pas' {FrmOrderStatusSearch},
  Morph.Sample.OrderStatusInfo in 'Forms\Order\Info\Morph.Sample.OrderStatusInfo.pas' {FrmOrderStatusInfo},
  Morph.Sample.ProductButton in 'Frames\Orders\Morph.Sample.ProductButton.pas' {TFrameProductButton: TFrame},
  Morph.Sample.MorphInit in 'DataModule\Morph.Sample.MorphInit.pas' {DMMorphInit: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogo, FrmLogo);
  Application.CreateForm(TFrmOrderStatusSearch, FrmOrderStatusSearch);
  Application.CreateForm(TFrmOrderStatusInfo, FrmOrderStatusInfo);
  Application.CreateForm(TDMMorphInit, DMMorphInit);
  Application.Run;
end.
