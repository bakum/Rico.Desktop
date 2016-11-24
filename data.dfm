object dmData: TdmData
  OldCreateOrder = False
  Height = 369
  Width = 553
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 376
    Top = 80
  end
  object Rico_olapConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=Rico_Olap')
    LoginPrompt = False
    Transaction = readTransaction
    UpdateTransaction = writeTransaction
    Left = 177
    Top = 167
  end
  object readTransaction: TFDTransaction
    Connection = Rico_olapConnection
    Left = 360
    Top = 184
  end
  object writeTransaction: TFDTransaction
    Connection = Rico_olapConnection
    Left = 360
    Top = 264
  end
end
