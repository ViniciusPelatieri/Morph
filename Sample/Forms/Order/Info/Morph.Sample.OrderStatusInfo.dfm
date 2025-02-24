object FrmOrderStatusInfo: TFrmOrderStatusInfo
  Left = 0
  Top = 0
  Caption = 'Order Status'
  ClientHeight = 129
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object PnBase: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 160
    Align = alTop
    Caption = 'Order Status'
    TabOrder = 0
    ExplicitLeft = 1
    ExplicitTop = 1
    object Obs: TLabeledEdit
      Left = 11
      Top = 70
      Width = 578
      Height = 23
      EditLabel.Width = 21
      EditLabel.Height = 15
      EditLabel.Caption = 'Obs'
      TabOrder = 0
      Text = ''
    end
    object LbEdtID: TLabeledEdit
      Left = 11
      Top = 23
      Width = 34
      Height = 23
      EditLabel.Width = 11
      EditLabel.Height = 15
      EditLabel.Caption = 'ID'
      TabOrder = 1
      Text = ''
    end
    object LbEdtName: TLabeledEdit
      Left = 51
      Top = 23
      Width = 234
      Height = 23
      EditLabel.Width = 32
      EditLabel.Height = 15
      EditLabel.Caption = 'Name'
      TabOrder = 2
      Text = ''
    end
    object PnSpecificity: TPanel
      Left = 291
      Top = 11
      Width = 298
      Height = 52
      TabOrder = 3
      object LbSpecificity: TLabel
        Left = 7
        Top = 6
        Width = 54
        Height = 15
        Caption = 'Specificity'
      end
      object ChkBxStockEntry: TCheckBox
        Left = 7
        Top = 27
        Width = 106
        Height = 17
        Caption = 'Stock Entry'
        TabOrder = 0
      end
      object ChkBxStockRemoval: TCheckBox
        Left = 102
        Top = 27
        Width = 97
        Height = 17
        Caption = 'Stock Removal'
        TabOrder = 1
      end
    end
    object BtnEdit: TButton
      Left = 493
      Top = 100
      Width = 45
      Height = 25
      Caption = 'Edit'
      TabOrder = 4
    end
    object BtnSave: TButton
      Left = 544
      Top = 100
      Width = 45
      Height = 25
      Caption = 'Save'
      TabOrder = 5
    end
  end
end
