unit Morph.LogoShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Morph.Sample.PDV, Morph.Sample.PeopleSearch,
  Morph.Sample.ProductSearch, Morph.Sample.OrdersSearch,
  Morph.Sample.ProductInfo, Morph.Sample.PeopleInfo,
  Morph.Sample.RegistrationType, Morph.Sample.RegistrationTypeInfo,
  Morph.Sample.AddressInfo, Morph.Sample.RegisterStatusInfo,
  Morph.Sample.RegisterStatusSearch, Morph.Sample.CategoryInfo,
  Morph.Sample.DepartmentInfo;

type
  TFrmLogo = class(TForm)
    ImgMorphLogo: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    private
      FSellerSearch: TFrmPeopleSearch;
      FNewClient,
      FClientEdit,
      FNewSeller,
      FSellerEdit: TFrmPeopleInfo;
      FNewProduct,
      FProductEdit: TFrmProductInfo;
      FNewRegistrationType,
      FRegistrationTypeEdit: TFrmRegistrationTypeInfo;
      FNewAddress,
      FAddressEdit: TFrmAddressInfo;
      FNewRegisterStatusInfo,
      FRegisterStatusInfoEdit: TFrmRegisterStatusInfo;
      FNewCategoryInfo,
      FCategoryInfoEdit: TFrmcategoryInfo;
      FNewDepartment,
      FDepartmentEdit: TFrmDepartmentInfo;
    public
      procedure OrdersSearchShow;
      procedure ClientsSearchShow;
      procedure SellersSearchShow;
      procedure ProductsSeachShow;
      procedure ReportsShow;
      procedure NewProductShow;
      procedure EditProductShow(const aProductID: Integer);
      procedure NewSeller;
      procedure EditSeller(const aSellerID: Integer);
      procedure NewClient;
      procedure EditClient(const aClientID: Integer);
      procedure RegistrationTypeSearchShow;
      procedure NewRegistrationType;
      procedure RegistrationTypeEdit(const aRegistrationTypeID: Integer);
      procedure AddressSearchShow;
      procedure NewAddress;
      procedure AddressEdit(const anAddressID: Integer);
      procedure NewRegistrationStatus;
      procedure RegistrationStatusEdit(const aRegistrationStatusID: Integer);
      procedure RegisterStatusSearchShow;
      procedure CategoriesSearch;
      procedure NewCategory;
      procedure CategoryEdit(const aCategoryID: Integer);
      procedure DepartmentSearchShow;
      procedure NewDepartment;
      procedure DepartmentEdit(const aDepartmentID: Integer);
      procedure OrderStatusSearch;
      procedure NewOrderStatus;
      procedure OrderStatusEdit(const anOrderStatusID: Integer);
end;

var
  FrmLogo: TFrmLogo;

implementation

uses Morph.Sample.Reports, Morph.Sample.AddressSearch,
  Morph.Sample.CategorySearch, Morph.Sample.DepartmentSearch;

{$R *.dfm}

procedure TFrmLogo.EditClient(const aClientID: Integer);
begin
  if NOT Assigned(FClientEdit) then
    FClientEdit := TFrmPeopleInfo.Create(Self);

  FClientEdit.Show;
  FClientEdit.EditClient(aClientID);
end;

procedure TFrmLogo.EditProductShow(const aProductID: Integer);
begin
  if NOT Assigned(FProductEdit) then
    FProductEdit := TFrmProductInfo.Create(Self);

  FrmProductInfo.Show;
  FrmProductInfo.Edit(aProductID);
end;

procedure TFrmLogo.EditSeller(const aSellerID: Integer);
begin
  if NOT Assigned(FSellerEdit) then
    FSellerEdit := TFrmPeopleInfo.Create(Self);

  FSellerEdit.Show;
  FSellerEdit.EditSeller(aSellerID);
end;

procedure TFrmLogo.FormCreate(Sender: TObject);
begin
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_LAYERED);
  SetLayeredWindowAttributes(Handle, ColorToRGB(clWhite), 0, LWA_COLORKEY);
  TThread.CreateAnonymousThread(procedure
  begin
    Sleep(1000);
    TThread.Synchronize(Nil, procedure
    begin
      ImgMorphLogo.Visible := False;
      Application.CreateForm(TFrmPDV, FrmPdv);
      FrmPdv.Show;
    end);
  end).Start;
end;

procedure TFrmLogo.FormDestroy(Sender: TObject);
begin
  if Assigned(FSellerSearch) then
    FSellerSearch.Free;

  if Assigned(FNewProduct) then
    FNewProduct.Free;

  if Assigned(FProductEdit) then
    FProductEdit.Free;

  if Assigned(FNewClient) then
    FNewClient.Free;

  if Assigned(FClientEdit) then
    FClientEdit.Free;

  if Assigned(FNewSeller) then
    FNewSeller.Free;

  if Assigned(FSellerEdit) then
    FSellerEdit.Free;

  if Assigned(FNewRegistrationType) then
    FNewRegistrationType.Free;

  if Assigned(FRegistrationTypeEdit) then
    FRegistrationTypeEdit.Free;

  if Assigned(FNewAddress) then
    FNewAddress.Free;

  if Assigned(FAddressEdit) then
    FAddressEdit.Free;

  if Assigned(FNewRegisterStatusInfo) then
    FNewRegisterStatusInfo.Free;

  if Assigned(FRegisterStatusInfoEdit) then
    FRegisterStatusInfoEdit.Free;

  if Assigned(FNewCategoryInfo) then
    FNewCategoryInfo.Free;

  if Assigned(FCategoryInfoEdit) then
    FCategoryInfoEdit.Free;

  if Assigned(FNewDepartment) then
    FNewDepartment.Free;

  if Assigned(FDepartmentEdit) then
    FDepartmentEdit.Free;
end;

procedure TFrmLogo.NewAddress;
begin
  if NOT Assigned(FNewAddress) then
    FNewAddress := TFrmAddressInfo.Create(Self);

  FNewAddress.Show;
  FNewAddress.NewRegister;
end;

procedure TFrmLogo.NewCategory;
begin
  if NOT Assigned(FNewCategoryInfo) then
    FNewCategoryInfo := TFrmcategoryInfo.Create(Self);

  FNewCategoryInfo.Show;
  FNewCategoryInfo.NewRegister;
end;

procedure TFrmLogo.NewClient;
begin
  if NOT Assigned(FNewClient)  then
     FNewClient := TFrmPeopleInfo.Create(Self);

   FNewClient.Show;
   FNewClient.NewClient;
end;

procedure TFrmLogo.NewDepartment;
begin
  if NOT Assigned(FNewDepartment) then
    FNewDepartment := TFrmDepartmentInfo.Create(Self);

  FNewDepartment.Show;
  FNewDepartment.NewRegister;
end;

procedure TFrmLogo.NewOrderStatus;
begin
d
end;

procedure TFrmLogo.NewProductShow;
begin
  if NOT Assigned(FNewProduct) then
    FNewProduct := TFrmProductInfo.Create(Self);

  FNewProduct.Show;
  FNewProduct.NewRegister;
end;

procedure TFrmLogo.NewRegistrationStatus;
begin
  if NOT Assigned(FNewRegisterStatusInfo) then
    FNewRegisterStatusInfo := TFrmRegisterStatusInfo.Create(Self);

  FNewRegisterStatusInfo.Show;
  FNewRegisterStatusInfo.NewRegister;
end;

procedure TFrmLogo.NewRegistrationType;
begin
  if NOT Assigned(FNewRegistrationType) then
    FNewRegistrationType := TFrmRegistrationTypeInfo.Create(Self);

  FNewRegistrationType.Show;
  FNewregistrationType.NewRegister;
end;

procedure TFrmLogo.NewSeller;
begin
  if NOT Assigned(FNewSeller) then
    FNewSeller := TFrmPeopleInfo.Create(Self);

  FNewSeller.Show;
  FNewSeller.NewSeller;
end;

procedure TFrmLogo.OrdersSearchShow;
begin
  if NOT Assigned(FrmOrdersSearch) then
    Application.CreateForm(TFrmOrdersSearch, FrmOrdersSearch);

  FrmOrdersSearch.Show;
end;

procedure TFrmLogo.OrderStatusEdit(const anOrderStatusID: Integer);
begin
        d
end;

procedure TFrmLogo.OrderStatusSearch;
begin
     d
end;

procedure TFrmLogo.AddressEdit(const anAddressID: Integer);
begin
    if NOT Assigned(FAddressEdit) then
    FAddressEdit := TFrmAddressInfo.Create(Self);

  FAddressEdit.Show;
  FAddressEdit.Edit(anAddressID);
end;

procedure TFrmLogo.AddressSearchShow;
begin
  if NOT Assigned(FrmAddresstSearch) then
    Application.CreateForm(TFrmAddresstSearch, FrmAddresstSearch);

  FrmAddresstSearch.Show;
end;

procedure TFrmLogo.CategoriesSearch;
begin
  if NOT Assigned(FrmCategorySearch) then
    Application.CreateForm(TFrmCategorySearch, FrmCategorySearch);

  FrmCategorySearch.Show;
end;

procedure TFrmLogo.CategoryEdit(const aCategoryID: Integer);
begin
  if NOT Assigned(FCategoryInfoEdit) then
    FCategoryInfoEdit := TFrmcategoryInfo.Create(Self);

  FCategoryInfoEdit.Show;
  FCategoryInfoEdit.Edit(aCategoryID);
end;

procedure TFrmLogo.ClientsSearchShow;
begin
  if NOT Assigned(FrmPeopleSearch) then
    Application.CreateForm(TFrmPeopleSearch, FrmPeopleSearch);

  FrmPeopleSearch.SearchForClients;
  FrmPeopleSearch.Show;
end;

procedure TFrmLogo.DepartmentEdit(const aDepartmentID: Integer);
begin
  if NOT Assigned(FDepartmentEdit) then
    FDepartmentEdit := TFrmDepartmentInfo.Create(Self);

  FDepartmentEdit.Show;
  FDepartmentEdit.Edit(aDepartmentID);
end;

procedure TFrmLogo.DepartmentSearchShow;
begin
  if NOT Assigned(FrmDepartmentSearch) then
    Application.CreateForm(TFrmDepartmentSearch, FrmDepartmentSearch);

  FrmDepartmentSearch.Show;
end;

procedure TFrmLogo.ProductsSeachShow;
begin
  if NOT Assigned(FrmProductSearch) then
    Application.CreateForm(TFrmProductSearch, FrmProductSearch);

  FrmProductSearch.Show;
end;

procedure TFrmLogo.RegisterStatusSearchShow;
begin
  if NOT Assigned(FrmRegisterStatusSearch) then
    Application.CreateForm(TFrmRegisterStatusSearch, FrmRegisterStatusSearch);

  FrmRegisterStatusSearch.Show;
end;

procedure TFrmLogo.RegistrationStatusEdit(const aRegistrationStatusID: Integer);
begin
  if NOT Assigned(FRegisterStatusInfoEdit) then
    FRegisterStatusInfoEdit := TFrmRegisterStatusInfo.Create(Self);

  FRegisterStatusInfoEdit.Show;
  FRegisterStatusInfoEdit.Edit(aRegistrationStatusID);
end;

procedure TFrmLogo.RegistrationTypeEdit(const aRegistrationTypeID: Integer);
begin
  if NOT Assigned(FRegistrationTypeEdit) then
    FRegistrationTypeEdit := TFrmRegistrationTypeInfo.Create(Self);

  FRegistrationTypeEdit.Show;
  FRegistrationTypeEdit.Edit(aRegistrationTypeID);
end;

procedure TFrmLogo.RegistrationTypeSearchShow;
begin
  if NOT Assigned(FrmRegistrationType) then
    Application.CreateForm(TFrmRegistrationType, FrmRegistrationType);

  FrmRegistrationType.Show;
end;

procedure TFrmLogo.ReportsShow;
begin
  if NOT Assigned(FrmReports) then
    Application.CreateForm(TFrmReports, FrmReports);

  FrmReports.Show;
end;

procedure TFrmLogo.SellersSearchShow;
begin
  if NOT Assigned(FSellerSearch) then
    FSellerSearch := TFrmPeopleSearch.Create(Self);

  FSellerSearch.SearchForSellers;
  FSellerSearch.Show;
end;

end.
