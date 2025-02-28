object DMMorphInit: TDMMorphInit
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 78
  Width = 82
  object FDCModelo: TFDConnection
    Params.Strings = (
      'Database=C:\debug\MORPH_SAMPLE_DB_FB5.FDB'
      'User_Name=SYSDBA'
      'Password=1234#ioje'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 16
  end
end
