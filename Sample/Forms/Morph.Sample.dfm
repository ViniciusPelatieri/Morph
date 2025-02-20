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
  object LbTable: TLabel
    Left = 8
    Top = 8
    Width = 28
    Height = 15
    Caption = 'Table'
  end
  object CBTable: TComboBox
    Left = 8
    Top = 32
    Width = 145
    Height = 23
    TabOrder = 0
    OnChange = CBTableChange
  end
  object BtnRefrshyables: TButton
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
    TabOrder = 1
    OnClick = BtnRefrshyablesClick
  end
  object DBGrid: TDBGrid
    Left = 8
    Top = 61
    Width = 986
    Height = 568
    DataSource = DSTable
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object BtnCreateTables: TButton
    Left = 248
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Create Tables'
    TabOrder = 3
    OnClick = BtnCreateTablesClick
  end
  object BtnDropTables: TButton
    Left = 248
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Drop Tables'
    TabOrder = 4
    OnClick = BtnDropTablesClick
  end
  object BtnLineInsert: TButton
    Left = 329
    Top = 30
    Width = 96
    Height = 25
    Caption = 'Line Insert'
    TabOrder = 5
    OnClick = BtnLineInsertClick
  end
  object BtnMphTableInsert: TButton
    Left = 329
    Top = 4
    Width = 96
    Height = 25
    Caption = 'mphTable Insert'
    TabOrder = 6
    OnClick = BtnMphTableInsertClick
  end
  object BtnJSONObjectInsert: TButton
    Left = 431
    Top = 30
    Width = 106
    Height = 25
    Caption = 'JSON Object Insert'
    TabOrder = 7
    OnClick = BtnJSONObjectInsertClick
  end
  object BtnJSONArrayInsert: TButton
    Left = 431
    Top = 4
    Width = 106
    Height = 25
    Caption = 'JSONArray Insert'
    TabOrder = 8
    OnClick = BtnJSONArrayInsertClick
  end
  object BtnJSONStringInsert: TButton
    Left = 543
    Top = 30
    Width = 106
    Height = 25
    Caption = 'JSON String insert'
    TabOrder = 9
    OnClick = BtnJSONStringInsertClick
  end
  object BtnTFDMemtableInsert: TButton
    Left = 542
    Top = 4
    Width = 107
    Height = 25
    Caption = 'Memtable Insert'
    TabOrder = 10
    OnClick = BtnTFDMemtableInsertClick
  end
  object BtnDropColumns: TButton
    Left = 653
    Top = 30
    Width = 113
    Height = 25
    Caption = 'Drop Columns'
    TabOrder = 11
    OnClick = BtnDropColumnsClick
  end
  object BtnAddFieldsInTable: TButton
    Left = 653
    Top = 4
    Width = 113
    Height = 25
    Caption = 'Add Fields in Table'
    TabOrder = 12
    OnClick = BtnAddFieldsInTableClick
  end
  object FDCDB: TFDConnection
    Params.Strings = (
      'Database=C:\debug\MORPH_SAMPLE_DB_FB5.FDB'
      'User_Name=SYSDBA'
      'Password=1234#ioje'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 192
    Top = 168
  end
  object DSTable: TDataSource
    DataSet = FDMTTable
    Left = 192
    Top = 232
  end
  object FDMTInsertOrder: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 384
    Top = 472
    object FDMTInsertOrderID: TIntegerField
      FieldName = 'ID'
    end
    object FDMTInsertOrderCLIENT_ID: TIntegerField
      FieldName = 'CLIENT_ID'
    end
    object FDMTInsertOrderPRODUCT_ID: TIntegerField
      FieldName = 'PRODUCT_ID'
    end
    object FDMTInsertOrderQUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object FDMTInsertOrderORDER_DATE: TDateField
      FieldName = 'ORDER_DATE'
    end
  end
  object FDMTTable: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 192
    Top = 296
    object FDMTTableID: TIntegerField
      FieldName = 'ID'
    end
  end
end
