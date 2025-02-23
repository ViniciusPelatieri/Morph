unit Morph.LogoShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Morph.Sample.PDV, Morph.Sample.PeopleSearch,
  Morph.Sample.ProductSearch, Morph.Sample.OrdersSearch;

type
  TFrmLogo = class(TForm)
    ImgMorphLogo: TImage;
    procedure FormCreate(Sender: TObject);
    private
      FSellerSearch: TFrmPeopleSearch;
    public
      procedure OrdersSearchShow;
      procedure ClientsSearchShow;
      procedure SellersSearchShow;
      procedure ProductsSeachShow;
end;

var
  FrmLogo: TFrmLogo;

implementation

{$R *.dfm}

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

procedure TFrmLogo.OrdersSearchShow;
begin
  if NOT Assigned(FrmOrdersSearch) then
    Application.CreateForm(TFrmOrdersSearch, FrmOrdersSearch);

  FrmOrdersSearch.Show;
end;

procedure TFrmLogo.ClientsSearchShow;
begin
  if NOT Assigned(FrmPeopleSearch) then
    Application.CreateForm(TFrmPeopleSearch, FrmPeopleSearch);

  FrmPeopleSearch.SearchForClients;
  FrmPeopleSearch.Show;
end;

procedure TFrmLogo.ProductsSeachShow;
begin
  if NOT Assigned(FrmProductSearch) then
  Application.CreateForm(TFrmProductSearch, FrmProductSearch);

  FrmProductSearch.Show;
end;

procedure TFrmLogo.SellersSearchShow;
begin
  if NOT Assigned(FSellerSearch) then
    FSellerSearch := TFrmPeopleSearch.Create(Self);

  FSellerSearch.SearchForSellers;
  FSellerSearch.Show;
end;

end.
