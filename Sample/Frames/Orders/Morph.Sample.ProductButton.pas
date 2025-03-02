unit Morph.Sample.ProductButton;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Skia, Vcl.Skia,
  Vcl.ExtCtrls, System.Types;

type
  TProcedureWithIntParam = procedure(AValue: Integer) of object;

  TTFrameProductButton = class(TFrame)
    PnBase: TPanel;
    PnImage: TPanel;
    PnLbNameNdPrice: TPanel;
    SkPBProductImage: TSkPaintBox;
    SkLbName: TSkLabel;
    SkLbPrice: TSkLabel;
    procedure SkAnimpPBFlashAnimationDraw(ASender: TObject;
      const ACanvas: ISkCanvas; const ADest: TRectF; const AProgress: Double;
      const AOpacity: Single);
    procedure SkPBProductImageDraw(ASender: TObject; const ACanvas: ISkCanvas;
      const ADest: TRectF; const AOpacity: Single);
  private
    { Private declarations }
    FDoingFlash: Boolean;
    FProductID: Integer;
    FProductImage: ISkImage;
    FFlashOpacity: Extended;
    FCallBackProcedure: TProcedureWithIntParam;
    procedure LoadDefaultImage;
    procedure Clicked(Sender: TObject);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function New(AOwner: TComponent) : TTFrameProductButton;
    function SetImage(const anImageBytes: TBytes): TTFrameProductButton;
    function SetName(const aName: String): TTFrameProductButton;
    function SetPrice(const aPrice: Extended): TTFrameProductButton;
    function CallBack(const ACallBackProcedure: TProcedureWithIntParam): TTFrameProductButton;
    function ProductID(const AProductID: Integer): TTFrameProductButton;
  end;

implementation

uses System.Threading, System.UITypes;

{$R *.dfm}

{ TTFrameProductButton }

function TTFrameProductButton.CallBack(
  const ACallBackProcedure: TProcedureWithIntParam): TTFrameProductButton;
begin
  FCallBackProcedure := ACallBackProcedure;
  Result := Self;
end;

procedure TTFrameProductButton.Clicked(Sender: TObject);
begin
  if (NOT Assigned(FCallBackProcedure)) OR (FProductID < 0) then
    Raise Exception.Create('Bad callback configuration. - Blank callback procedure or product ID');

  FCallBackProcedure(FProductID);
end;

constructor TTFrameProductButton.Create(AOwner: TComponent);
begin
  inherited;
  LoadDefaultImage;
end;

destructor TTFrameProductButton.Destroy;
begin
  if Assigned(FCallBackProcedure) then
    FCallBackProcedure := Nil;
  inherited;
end;

procedure TTFrameProductButton.LoadDefaultImage;
begin

end;

class function TTFrameProductButton.New(AOwner: TComponent): TTFrameProductButton;
begin
  Result := Self.Create(AOwner);
end;

function TTFrameProductButton.ProductID(
  const AProductID: Integer): TTFrameProductButton;
begin
  FProductID := AProductID;
  Result := Self;
end;

function TTFrameProductButton.SetImage(
  const anImageBytes: TBytes): TTFrameProductButton;
var
  LStream: TStream;
begin
  if Length(anImageBytes) = 0 then
  begin
    LoadDefaultImage;
    Exit;
  end;

  LStream := TMemoryStream.Create;
  try
    LStream.WriteBuffer(anImageBytes[0], Length(anImageBytes));
    LStream.Position := 0;

    FProductImage := TSkImage.MakeFromEncodedStream(LStream);
    SkPBProductImage.Redraw;
  finally
    LStream.Free;
  end;

  Result := Self;
end;

function TTFrameProductButton.SetName(
  const aName: String): TTFrameProductButton;
begin
  SkLbName.Caption := aName;
  Result := Self;
end;

function TTFrameProductButton.SetPrice(
  const aPrice: Extended): TTFrameProductButton;
begin
  SkLbPrice.Caption := FloatToStr(aPrice);
  Result := Self;
end;

procedure TTFrameProductButton.SkAnimpPBFlashAnimationDraw(ASender: TObject;
  const ACanvas: ISkCanvas; const ADest: TRectF; const AProgress: Double;
  const AOpacity: Single);
var
  LPaint: ISKPaint;
begin
  LPaint := TSKPaint.Create;
  LPaint.Color := TAlphaColors.Blue;
  LPaint.AlphaF := FFlashOpacity;

  ACanvas.DrawRect(ADest, LPaint);
end;

procedure TTFrameProductButton.SkPBProductImageDraw(ASender: TObject;
  const ACanvas: ISkCanvas; const ADest: TRectF; const AOpacity: Single);
begin
  if Assigned(FProductImage) then
  begin
    ACanvas.DrawImage(FProductImage, 0, 0);
  end;
end;

end.
