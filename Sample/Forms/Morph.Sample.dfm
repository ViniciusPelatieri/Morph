object Sample: TSample
  Left = 0
  Top = 0
  Caption = 'Sample'
  ClientHeight = 714
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
  object LbFrom: TLabel
    Left = 218
    Top = 442
    Width = 44
    Height = 21
    Caption = 'FROM'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LbWhere: TLabel
    Left = 414
    Top = 444
    Width = 52
    Height = 21
    Caption = 'WHERE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LbField: TLabel
    Left = 472
    Top = 423
    Width = 25
    Height = 15
    Caption = 'Field'
  end
  object LbComparison: TLabel
    Left = 599
    Top = 423
    Width = 65
    Height = 15
    Caption = 'Comparison'
  end
  object LbValue: TLabel
    Left = 750
    Top = 423
    Width = 28
    Height = 15
    Caption = 'Value'
  end
  object Label1: TLabel
    Left = 877
    Top = 423
    Width = 34
    Height = 15
    Caption = 'Label1'
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
    Height = 356
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
  object BtnSelect: TButton
    Left = 8
    Top = 439
    Width = 75
    Height = 25
    Caption = 'Select'
    TabOrder = 13
  end
  object CheckListBox1: TCheckListBox
    Left = 89
    Top = 439
    Width = 121
    Height = 234
    ItemHeight = 17
    TabOrder = 14
  end
  object ComboBox1: TComboBox
    Left = 271
    Top = 444
    Width = 135
    Height = 23
    TabOrder = 15
    Text = 'ComboBox1'
  end
  object CheckListBox2: TCheckListBox
    Left = 472
    Top = 444
    Width = 121
    Height = 77
    ItemHeight = 17
    TabOrder = 16
  end
  object ComboBox2: TComboBox
    Left = 599
    Top = 444
    Width = 145
    Height = 23
    TabOrder = 17
    Text = 'ComboBox2'
  end
  object Edit1: TEdit
    Left = 750
    Top = 444
    Width = 121
    Height = 23
    TabOrder = 18
    Text = 'Edit1'
  end
  object ComboBox3: TComboBox
    Left = 877
    Top = 444
    Width = 83
    Height = 23
    TabOrder = 19
    Text = 'ComboBox3'
  end
  object BtnSelectTes: TButton
    Left = 752
    Top = 544
    Width = 129
    Height = 25
    Caption = 'BtnSelect Test'
    TabOrder = 20
    OnClick = BtnSelectTesClick
  end
  object FDCDB: TFDConnection
    Params.Strings = (
      'Database=C:\debug\MORPH_SAMPLE_DB_FB5.FDB'
      'User_Name=SYSDBA'
      'Password=1234#ioje'
      'DriverID=FB')
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
    Left = 264
    Top = 168
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
    object FDMTInsertOrderSELLER_ID: TIntegerField
      FieldName = 'SELLER_ID'
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
