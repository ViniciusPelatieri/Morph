unit Morph.DataConvertionsUtilities;

interface

uses
  System.SysUtils;

type
  TMorphDataConvertions = class
    public
      class function PNG_to_Bytes(const APngFilePath: String): TBytes;
  end;

implementation

{ TMorphDataConvertions }

uses   Vcl.Imaging.pngimage, System.Classes, Vcl.Graphics;


class function TMorphDataConvertions.PNG_to_Bytes(
  const APngFilePath: String): TBytes;
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
    Bitmap.SetSize(126, 126);
    Bitmap.Canvas.StretchDraw(Rect(0, 0, 126, 126), PNG);
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

end.
