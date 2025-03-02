object TFrameProductButton: TTFrameProductButton
  Left = 0
  Top = 0
  Width = 160
  Height = 218
  TabOrder = 0
  object PnBase: TPanel
    Left = 0
    Top = 0
    Width = 160
    Height = 218
    Align = alClient
    TabOrder = 0
    object PnImage: TPanel
      AlignWithMargins = True
      Left = 16
      Top = 16
      Width = 128
      Height = 128
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Align = alTop
      TabOrder = 0
      object SkPBProductImage: TSkPaintBox
        Left = 1
        Top = 1
        Width = 126
        Height = 126
        Align = alClient
        OnDraw = SkPBProductImageDraw
        ExplicitLeft = 48
        ExplicitTop = 96
        ExplicitWidth = 50
        ExplicitHeight = 50
      end
    end
    object PnLbNameNdPrice: TPanel
      AlignWithMargins = True
      Left = 16
      Top = 162
      Width = 128
      Height = 50
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Align = alTop
      Color = clWhitesmoke
      ParentBackground = False
      TabOrder = 1
      object SkLbName: TSkLabel
        Left = 1
        Top = 1
        Width = 126
        Height = 19
        Align = alTop
        TextSettings.HorzAlign = Center
        TextSettings.MaxLines = 1
        Words = <
          item
            Caption = 'Product Name'
          end>
        ExplicitLeft = 39
        ExplicitTop = 4
        ExplicitWidth = 55
      end
      object SkLbPrice: TSkLabel
        AlignWithMargins = True
        Left = 4
        Top = 26
        Width = 120
        Height = 19
        Margins.Top = 6
        Align = alTop
        TextSettings.HorzAlign = Center
        Words = <
          item
            Caption = '$99,99'
          end>
        ExplicitLeft = 72
        ExplicitTop = 24
        ExplicitWidth = 55
      end
    end
  end
end
