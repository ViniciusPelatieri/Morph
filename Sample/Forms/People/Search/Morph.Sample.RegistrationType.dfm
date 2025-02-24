object FrmRegistrationType: TFrmRegistrationType
  Left = 0
  Top = 0
  Caption = 'Registration Type'
  ClientHeight = 477
  ClientWidth = 602
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
    Width = 602
    Height = 477
    Align = alClient
    TabOrder = 0
    object PnFilters: TPanel
      Left = 1
      Top = 1
      Width = 600
      Height = 144
      Align = alTop
      TabOrder = 0
      object LbEdtGlobalSearch: TLabeledEdit
        Left = 7
        Top = 22
        Width = 578
        Height = 23
        EditLabel.Width = 72
        EditLabel.Height = 15
        EditLabel.Caption = 'Global Search'
        TabOrder = 0
        Text = ''
      end
      object LbEdtID: TLabeledEdit
        Left = 7
        Top = 66
        Width = 34
        Height = 23
        EditLabel.Width = 11
        EditLabel.Height = 15
        EditLabel.Caption = 'ID'
        TabOrder = 1
        Text = ''
      end
      object LbEdtName: TLabeledEdit
        Left = 47
        Top = 66
        Width = 234
        Height = 23
        EditLabel.Width = 32
        EditLabel.Height = 15
        EditLabel.Caption = 'Name'
        TabOrder = 2
        Text = ''
      end
      object Obs: TLabeledEdit
        Left = 7
        Top = 113
        Width = 578
        Height = 23
        EditLabel.Width = 21
        EditLabel.Height = 15
        EditLabel.Caption = 'Obs'
        TabOrder = 3
        Text = ''
      end
      object PnSpecificity: TPanel
        Left = 287
        Top = 54
        Width = 298
        Height = 52
        TabOrder = 4
        object LbSpecificity: TLabel
          Left = 7
          Top = 6
          Width = 54
          Height = 15
          Caption = 'Specificity'
        end
        object ChkBxSellProducts: TCheckBox
          Left = 7
          Top = 27
          Width = 97
          Height = 17
          Caption = 'Sell Products'
          TabOrder = 0
        end
      end
    end
    object PnGrid: TPanel
      Left = 1
      Top = 145
      Width = 600
      Height = 331
      Align = alClient
      TabOrder = 1
      object DBGridRegType: TDBGrid
        Left = 1
        Top = 1
        Width = 598
        Height = 329
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
  end
  object Menu: TMainMenu
    Left = 337
    Top = 249
    object MenuNewRegistrationType: TMenuItem
      Caption = 'New Registration Type'
      OnClick = MenuNewRegistrationTypeClick
    end
  end
end
