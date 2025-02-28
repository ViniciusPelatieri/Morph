unit Morph.Sample.ProductButton;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Skia, Vcl.Skia,
  Vcl.ExtCtrls, System.Types;

type
  TTFrameProductButton = class(TFrame)
    PnBase: TPanel;
    PnImage: TPanel;
    PnLbNameNdPrice: TPanel;
    SkPBProductImage: TSkPaintBox;
    SkLbName: TSkLabel;
    SkLbPrice: TSkLabel;
    SkAnPBFlash: TSkAnimatedPaintBox;
    procedure SkPBProductImageDraw(ASender: TObject; const ACanvas: ISkCanvas;
      const ADest: TRectF; const AOpacity: Single);
  private
    { Private declarations }
    FDoingFlash: Boolean;
    FProductImage: ISkImage;
    procedure LoadDefaultImage;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    class function New(AOwner: TComponent) : TTFrameProductButton;
    function SetImage(const anImageBytes: TBytes): TTFrameProductButton;
    function SetName(const aName: String): TTFrameProductButton;
    function SetPrice(const aPrice: Extended): TTFrameProductButton;
    function Flash: TTFrameProductButton;
  end;

implementation

uses System.Threading;

{$R *.dfm}

{ TTFrameProductButton }

constructor TTFrameProductButton.Create(AOwner: TComponent);
begin
  inherited;
  LoadDefaultImage;
end;

function TTFrameProductButton.Flash: TTFrameProductButton;
const
  COpacityJump = 5;
var
  FOpacity: Integer;
begin
  TTask.Run(
  procedure
  begin
    if FDoingFlash then
      Exit;

    FDoingFlash := True;
    FOpacity := 0;
    while FOpacity < 255 do
    begin
      SkAnPBFlash.Opacity := FOpacity;
      Inc(FOpacity, COpacityJump);
    end;
    FOpacity := 255;
      while FOpacity > 0 do
    begin
      SkAnPBFlash.Opacity := FOpacity;
      Dec(FOpacity, COpacityJump);
    end;
    FOpacity := 0;
    FDoingFlash := False;
  end);
end;

procedure TTFrameProductButton.LoadDefaultImage;
begin

end;

class function TTFrameProductButton.New(AOwner: TComponent): TTFrameProductButton;
begin
  Result := Self.Create(AOwner);
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
    SkPBProductImage.Repaint;
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

procedure TTFrameProductButton.SkPBProductImageDraw(ASender: TObject;
  const ACanvas: ISkCanvas; const ADest: TRectF; const AOpacity: Single);
begin
  if Assigned(FProductImage) then
    ACanvas.DrawImage(FProductImage, 50, 50);
end;

end.
