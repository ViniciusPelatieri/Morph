unit Morph.Sample.ProductInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.Imaging.pngimage, System.Skia, Vcl.Skia, Vcl.ExtDlgs,
  System.Types;

type
  TFrmProductInfo = class(TForm)
    PnBase: TPanel;
    LbEdtID: TLabeledEdit;
    LbEdtDescription: TLabeledEdit;
    LbEdtPrice: TLabeledEdit;
    LbEdtMaxDiscount: TLabeledEdit;
    LbEdtAvaliableQtd: TLabeledEdit;
    LbEdtMinimumStockQtd: TLabeledEdit;
    LbEdtMinSellQtd: TLabeledEdit;
    LbEdtMaxSellQtd: TLabeledEdit;
    LbCategory: TLabel;
    CbCategory: TComboBox;
    Menu: TMainMenu;
    MenuCategories: TMenuItem;
    BtnSave: TButton;
    BtnEdit: TButton;
    LbEdtShortName: TLabeledEdit;
    SkLbClickToEdit: TSkLabel;
    SkPbProductImage: TSkPaintBox;
    PnProductPicture: TPanel;
    DialogLookForPicture: TOpenPictureDialog;
    procedure MenuCategoriesClick(Sender: TObject);
    procedure ShowClickToEdit(Sender: TObject);
    procedure HideClickToEdit(Sender: TObject);
    procedure SkLbClickToEditClick(Sender: TObject);
    procedure DialogLookForPictureSelectionChange(Sender: TObject);
    procedure DialogLookForPictureClose(Sender: TObject);
    procedure SkPbProductImageDraw(ASender: TObject; const ACanvas: ISkCanvas;
      const ADest: TRectF; const AOpacity: Single);
  private
    { Private declarations }
    FPicturePath: String;
    FProductImage: ISkImage;
  public
    { Public declarations }
    procedure Edit(const aProductID: Integer);
    procedure NewRegister;
  end;

var
  FrmProductInfo: TFrmProductInfo;

implementation

uses
  Morph.LogoShow, Morph.Sample.Utilities;

{$R *.dfm}

{ TFrmProductInfo }

procedure TFrmProductInfo.DialogLookForPictureClose(Sender: TObject);
var
  LStream: TStream;
  LPictureBytes: TBytes;
  LPictureDimentions: TMorphSamplePngDimentions;
begin
  LPictureDimentions := TMorphSampleUtilities.GetPngDimentions(FPicturePath);
  LPictureBytes := TMorphSampleUtilities.PNG_to_Bytes(FPicturePath, LPictureDimentions.Width, LPictureDimentions.Height);
  LPictureBytes := TMorphSampleUtilities.ResizePNGFromBytes(LPictureBytes, 135, 135);

  if Length(LPictureBytes) = 0 then
    Exit;


  LStream := TMemoryStream.Create;
  try
    LStream.WriteBuffer(LPictureBytes[0], Length(LPictureBytes));
    LStream.Position := 0;

    FProductImage := TSkImage.MakeFromEncodedStream(LStream);
    SkPBProductImage.Redraw;
  finally
    LStream.Free;
  end;
end;

procedure TFrmProductInfo.DialogLookForPictureSelectionChange(Sender: TObject);
begin
  FPicturePath := DialogLookForPicture.FileName;
end;

procedure TFrmProductInfo.Edit(const aProductID: Integer);
begin
  Self.Caption := 'Edit Product';
end;

procedure TFrmProductInfo.MenuCategoriesClick(Sender: TObject);
begin
  FrmLogo.CategoriesSearch;
end;

procedure TFrmProductInfo.NewRegister;
begin
  Self.Caption := 'New Product';
end;

procedure TFrmProductInfo.ShowClickToEdit(Sender: TObject);
begin
  SkLbClickToEdit.Visible := True;
end;

procedure TFrmProductInfo.SkLbClickToEditClick(Sender: TObject);
begin
  DialogLookForPicture.Execute;
end;

procedure TFrmProductInfo.SkPbProductImageDraw(ASender: TObject;
  const ACanvas: ISkCanvas; const ADest: TRectF; const AOpacity: Single);
begin
  if Assigned(FProductImage) then
  begin
    ACanvas.DrawImage(FProductImage, 0, 0);
  end;
end;

procedure TFrmProductInfo.HideClickToEdit(Sender: TObject);
begin
  SkLbClickToEdit.Visible := False;
end;

end.
