object FrmProductInfo: TFrmProductInfo
  Left = 0
  Top = 0
  Caption = 'Product'
  ClientHeight = 166
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = Menu
  TextHeight = 15
  object PnBase: TPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 166
    Align = alClient
    TabOrder = 0
    object LbCategory: TLabel
      Left = 151
      Top = 111
      Width = 48
      Height = 15
      Caption = 'Category'
    end
    object LbEdtID: TLabeledEdit
      Left = 151
      Top = 34
      Width = 33
      Height = 23
      EditLabel.Width = 11
      EditLabel.Height = 15
      EditLabel.Caption = 'ID'
      ReadOnly = True
      TabOrder = 0
      Text = ''
    end
    object LbEdtDescription: TLabeledEdit
      Left = 199
      Top = 34
      Width = 473
      Height = 23
      EditLabel.Width = 60
      EditLabel.Height = 15
      EditLabel.Caption = 'Description'
      TabOrder = 1
      Text = ''
    end
    object LbEdtPrice: TLabeledEdit
      Left = 292
      Top = 130
      Width = 73
      Height = 23
      EditLabel.Width = 26
      EditLabel.Height = 15
      EditLabel.Caption = 'Price'
      TabOrder = 2
      Text = ''
    end
    object LbEdtMaxDiscount: TLabeledEdit
      Left = 371
      Top = 130
      Width = 81
      Height = 23
      EditLabel.Width = 75
      EditLabel.Height = 15
      EditLabel.Caption = 'Max Discount '
      TabOrder = 3
      Text = ''
    end
    object LbEdtAvaliableQtd: TLabeledEdit
      Left = 292
      Top = 82
      Width = 81
      Height = 23
      EditLabel.Width = 74
      EditLabel.Height = 15
      EditLabel.Caption = 'Avaliable QTD'
      TabOrder = 4
      Text = ''
    end
    object LbEdtMinimumStockQtd: TLabeledEdit
      Left = 388
      Top = 82
      Width = 81
      Height = 23
      EditLabel.Width = 76
      EditLabel.Height = 15
      EditLabel.Caption = 'Min Stock Qtd'
      TabOrder = 5
      Text = ''
    end
    object LbEdtMinSellQtd: TLabeledEdit
      Left = 484
      Top = 82
      Width = 73
      Height = 23
      EditLabel.Width = 65
      EditLabel.Height = 15
      EditLabel.Caption = 'Min Sell Qtd'
      TabOrder = 6
      Text = ''
    end
    object LbEdtMaxSellQtd: TLabeledEdit
      Left = 572
      Top = 82
      Width = 73
      Height = 23
      EditLabel.Width = 66
      EditLabel.Height = 15
      EditLabel.Caption = 'Max Sell Qtd'
      TabOrder = 7
      Text = ''
    end
    object CbCategory: TComboBox
      Left = 151
      Top = 130
      Width = 117
      Height = 23
      TabOrder = 8
    end
    object BtnSave: TButton
      Left = 597
      Top = 129
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 9
    end
    object BtnEdit: TButton
      Left = 530
      Top = 129
      Width = 61
      Height = 25
      Caption = 'Edit'
      TabOrder = 10
    end
    object LbEdtShortName: TLabeledEdit
      Left = 151
      Top = 82
      Width = 129
      Height = 23
      EditLabel.Width = 90
      EditLabel.Height = 15
      EditLabel.Caption = 'LbEdtShortName'
      TabOrder = 11
      Text = ''
    end
    object PnProductPicture: TPanel
      Left = 8
      Top = 16
      Width = 137
      Height = 137
      TabOrder = 12
      OnMouseEnter = ShowClickToEdit
      OnMouseLeave = HideClickToEdit
      object SkPbProductImage: TSkPaintBox
        Left = -1
        Top = -1
        Width = 138
        Height = 138
        OnMouseEnter = ShowClickToEdit
        OnMouseLeave = HideClickToEdit
        OnDraw = SkPbProductImageDraw
      end
      object SkLbClickToEdit: TSkLabel
        Left = 1
        Top = 1
        Width = 135
        Height = 135
        Align = alClient
        Visible = False
        OnClick = SkLbClickToEditClick
        OnMouseEnter = ShowClickToEdit
        OnMouseLeave = HideClickToEdit
        TextSettings.Decorations.Decorations = [Overline]
        TextSettings.Font.Size = 20.000000000000000000
        TextSettings.Font.Weight = UltraBold
        TextSettings.HorzAlign = Center
        Words = <
          item
            BackgroundColor = claSilver
            Caption = 'Click to Edit'
            Decorations.Thickness = 3.000000000000000000
            FontColor = claAliceblue
            StyledSettings = [Family, Size, Style]
          end>
        ExplicitLeft = 50
        ExplicitTop = 76
        ExplicitWidth = 73
        ExplicitHeight = 19
      end
    end
  end
  object Menu: TMainMenu
    Left = 416
    object MenuCategories: TMenuItem
      Caption = 'Categories'
      OnClick = MenuCategoriesClick
    end
  end
  object DialogLookForPicture: TOpenPictureDialog
    OnClose = DialogLookForPictureClose
    OnSelectionChange = DialogLookForPictureSelectionChange
    Left = 344
  end
end
