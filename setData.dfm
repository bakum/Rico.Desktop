object dmSettings: TdmSettings
  OldCreateOrder = False
  Height = 267
  Width = 364
  object Rico_settingsConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=Rico_settings')
    Connected = True
    LoginPrompt = False
    Left = 222
    Top = 64
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 64
    Top = 16
  end
  object ConnectionsTable: TFDQuery
    Connection = Rico_settingsConnection
    SQL.Strings = (
      'SELECT * FROM connections')
    Left = 192
    Top = 131
    object ConnectionsTableid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object ConnectionsTableu_name: TStringField
      FieldName = 'u_name'
      Origin = 'u_name'
      Required = True
      Size = 50
    end
    object ConnectionsTablepass_wd: TStringField
      FieldName = 'pass_wd'
      Origin = 'pass_wd'
      Required = True
      Size = 50
    end
  end
  object fdUpdate: TFDUpdateSQL
    Connection = Rico_settingsConnection
    InsertSQL.Strings = (
      'INSERT INTO CONNECTIONS'
      '(U_NAME, PASS_WD)'
      'VALUES (:NEW_U_NAME, :NEW_PASS_WD);'
      'SELECT LAST_INSERT_AUTOGEN() AS ID, U_NAME, PASS_WD'
      'FROM CONNECTIONS'
      'WHERE ID = LAST_INSERT_AUTOGEN()')
    ModifySQL.Strings = (
      'UPDATE CONNECTIONS'
      'SET ID = :NEW_ID, U_NAME = :NEW_U_NAME, PASS_WD = :NEW_PASS_WD'
      'WHERE ID = :OLD_ID;'
      'SELECT ID, U_NAME, PASS_WD'
      'FROM CONNECTIONS'
      'WHERE ID = :NEW_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CONNECTIONS'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT LAST_INSERT_AUTOGEN() AS ID, U_NAME, PASS_WD'
      'FROM CONNECTIONS'
      'WHERE ID = :ID')
    Left = 296
    Top = 136
  end
  object fdCreate: TFDScript
    SQLScripts = <
      item
        SQL.Strings = (
          'PRAGMA foreign_keys = off;'
          'BEGIN TRANSACTION;'
          ''
          '-- '#1058#1072#1073#1083#1080#1094#1072': connections'
          
            'CREATE TABLE connections (id INTEGER NOT NULL PRIMARY KEY AUTOIN' +
            'CREMENT UNIQUE, u_name VARCHAR (50) NOT NULL UNIQUE DEFAULT sa, ' +
            'pass_wd VARCHAR (50) NOT NULL);'
          ''
          'COMMIT TRANSACTION;'
          'PRAGMA foreign_keys = on;')
      end>
    Connection = Rico_settingsConnection
    Params = <>
    Macros = <>
    Left = 192
    Top = 208
  end
end
