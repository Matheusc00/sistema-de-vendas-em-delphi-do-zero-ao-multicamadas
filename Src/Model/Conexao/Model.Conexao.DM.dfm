object ModelConexaoDM: TModelConexaoDM
  OldCreateOrder = False
  Height = 248
  Width = 421
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=sa'
      'Password=sql123'
      'Server=DESKTOP-ID08SQI\SQLEXPRESS'
      'Database=Dados'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 80
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 40
    Top = 136
  end
end
