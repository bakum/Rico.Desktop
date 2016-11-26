object dmData: TdmData
  OldCreateOrder = False
  Height = 369
  Width = 613
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    ODBCDriver = 'SQL Server'
    Left = 480
    Top = 8
  end
  object Rico_olapConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=Rico_Olap')
    LoginPrompt = False
    Transaction = trRead
    UpdateTransaction = trWrite
    Left = 345
    Top = 7
  end
  object trRead: TFDTransaction
    Connection = Rico_olapConnection
    Left = 480
    Top = 64
  end
  object trWrite: TFDTransaction
    Connection = Rico_olapConnection
    Left = 424
    Top = 64
  end
end
