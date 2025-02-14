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
    OnChange = ComboBox1Change
  end
  object Button1: TButton
    Left = 896
    Top = 30
    Width = 98
    Height = 25
    Caption = 'Run Changes'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 151
    Top = 30
    Width = 26
    Height = 25
    Caption = #55357#56580
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 61
    Width = 986
    Height = 568
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Button3: TButton
    Left = 248
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Create Tables'
    TabOrder = 4
    OnClick = Button3Click
  end
  object BtnDelete: TButton
    Left = 248
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Drop Tables'
    TabOrder = 5
    OnClick = BtnDeleteClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\debug\MORPH_SAMPLE_DB_FB5.FDB'
      'User_Name=SYSDBA'
      'Password=1234#ioje'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 728
    Top = 144
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 192
    Top = 224
  end
  object FDMTOrder: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 384
    Top = 472
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
  object FDMemTable1: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 192
    Top = 344
    object FDMemTable1ID: TIntegerField
      FieldName = 'ID'
    end
  end
end
