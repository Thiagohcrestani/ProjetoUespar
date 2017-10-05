object DM: TDM
  OldCreateOrder = False
  Height = 569
  Width = 803
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Documentos\Projetos Uespar\BancoDados\BD.GDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=IB')
    Left = 56
    Top = 40
  end
  object FDQESTADO: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT MAX (ID_ESTADO) FROM ESTADO')
    Left = 144
    Top = 40
    object FDQESTADOMAX: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MAX'
      Origin = '"MAX"'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
