unit Morph.Sample.Utilities;

interface

uses
  System.SysUtils, Vcl.Skia, System.Skia, System.Types;

type
  TMorphSamplePngDimentions = record
    Width,
    Height: Integer;
  end;

  TMorphSampleUtilities = class
    public
      class function PNG_to_Bytes(
        const APngFilePath: String; const AWidth, AHeight: Integer): TBytes;
      class function GetPngDimentions(const AImagepath: String): TMorphSamplePngDimentions;
      class function ResizePNGFromBytes(
        const AImageBytes: TBytes; const ANewWidth, ANewHeight: Integer): TBytes;
  end;

implementation

{ TMorphDataConvertions }

uses   Vcl.Imaging.pngimage, System.Classes, Vcl.Graphics;

class function TMorphSampleUtilities.GetPngDimentions(
  const AImagepath: String): TMorphSamplePngDimentions;
var
  PNG: TPNGImage;
begin
  PNG := TPNGImage.Create;
  try
    PNG.LoadFromFile(aImagepath);
    Result.Width := PNG.Width;
    Result.Height := PNG.Height;
  finally
    PNG.Free;
  end;
end;

class function TMorphSampleUtilities.PNG_to_Bytes(
  const APngFilePath: String; const AWidth, AHeight: Integer): TBytes;
var
  PNG: TPngImage;
  Stream: TMemoryStream;
  Bitmap: TBitmap;
begin
  PNG := TPngImage.Create;
  Stream := TMemoryStream.Create;
  Bitmap := TBitmap.Create;
  try
    PNG.LoadFromFile(APngFilePath);
    Bitmap.SetSize(AWidth, AHeight);
    Bitmap.Canvas.StretchDraw(Rect(0, 0, AWidth, AHeight), PNG);
    PNG.Assign(Bitmap);
    PNG.SaveToStream(Stream);
    SetLength(Result, Stream.Size);
    Stream.Position := 0;
    Stream.ReadBuffer(Result[0], Stream.Size);
  finally
    Bitmap.Free;
    Stream.Free;
    PNG.Free;
  end;
end;

class function TMorphSampleUtilities.ResizePNGFromBytes(
  const AImageBytes: TBytes; const ANewWidth, ANewHeight: Integer): TBytes;
var
  Stream: TMemoryStream;
  PNG: TPngImage;
  Bitmap: TBitmap;
begin
  Result := nil;

  if Length(AImageBytes) = 0 then
    Exit;

  Stream := TMemoryStream.Create;
  try
    Stream.WriteBuffer(AImageBytes[0], Length(AImageBytes));
    Stream.Position := 0;
    PNG := TPngImage.Create;
    try
      PNG.LoadFromStream(Stream);
      Bitmap := TBitmap.Create;
      try
        Bitmap.SetSize(ANewWidth, ANewHeight);
        Bitmap.Canvas.StretchDraw(Rect(0, 0, ANewWidth, ANewHeight), PNG);
        PNG.Assign(Bitmap);
        Stream.Clear;
        PNG.SaveToStream(Stream);
        SetLength(Result, Stream.Size);
        Stream.Position := 0;
        Stream.ReadBuffer(Result[0], Stream.Size);
      finally
        Bitmap.Free;
      end;
    finally
      PNG.Free;
    end;
  finally
    Stream.Free;
  end;
end;

end.
