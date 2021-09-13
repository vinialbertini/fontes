object dmConexao: TdmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 287
  Width = 567
  object FDConexao: TFDConnection
    Params.Strings = (
      'Database=C:\TesteFortes\Dados\DADOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Left = 200
    Top = 96
  end
  object fdqRel: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'select Data,'
      'Substring(Tanque FROM 2 FOR CHAR_LENGTH(Tanque)) as Tanque,'
      
        'Substring(Bomba FROM 2 FOR 1)||'#39'-'#39'||Substring(Bomba FROM 4 FOR C' +
        'HAR_LENGTH(Bomba)) as Bomba,'
      'Valor'
      'from abastecimento')
    Left = 304
    Top = 72
  end
end
