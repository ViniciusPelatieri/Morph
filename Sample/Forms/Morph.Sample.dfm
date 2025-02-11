object Sample: TSample
  Left = 0
  Top = 0
  Caption = 'Sample'
  ClientHeight = 637
  ClientWidth = 1002
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 34
    Height = 15
    Caption = 'Tabela'
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 32
    Width = 145
    Height = 23
    TabOrder = 0
    Text = 'ComboBox1'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 61
    Width = 986
    Height = 568
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\debug\MORPH_SAMPLE_DB_FB5.FDB'
      'User_Name=SYSDBA'
      'Password=1234#ioje'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 384
    Top = 256
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 240
    Top = 320
  end
  object FDMTOrder: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 744
    Top = 264
    object FDMTOrderID: TIntegerField
      FieldName = 'ID'
    end
    object FDMTOrderCLIENT_ID: TIntegerField
      FieldName = 'CLIENT_ID'
    end
    object FDMTOrderPRODUCT_ID: TIntegerField
      FieldName = 'PRODUCT_ID'
    end
    object FDMTOrderQUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object FDMTOrderORDER_DATE: TDateField
      FieldName = 'ORDER_DATE'
    end
  end
end
