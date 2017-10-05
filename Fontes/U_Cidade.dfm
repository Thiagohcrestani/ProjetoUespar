inherited F_Cidade: TF_Cidade
  Caption = 'Cadastro De Cidade'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      object Label1: TLabel
        Left = 20
        Top = 32
        Width = 46
        Height = 13
        Caption = 'Id Cidade'
      end
      object Label2: TLabel
        Left = 20
        Top = 88
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label3: TLabel
        Left = 20
        Top = 152
        Width = 23
        Height = 13
        Caption = 'Cep:'
      end
      object Label4: TLabel
        Left = 20
        Top = 208
        Width = 50
        Height = 13
        Caption = 'Id Estado:'
      end
      object Edit1: TEdit
        Left = 20
        Top = 61
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 20
        Top = 125
        Width = 385
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 20
        Top = 171
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object Edit4: TEdit
        Left = 20
        Top = 227
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 3
      end
    end
    inherited TabSheet2: TTabSheet
      object Edit5: TEdit
        Left = 41
        Top = 80
        Width = 521
        Height = 21
        TabOrder = 2
        OnChange = Edit5Change
      end
      object DBGrid1: TDBGrid
        Left = 12
        Top = 177
        Width = 576
        Height = 120
        DataSource = DataSource1
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_CIDADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CIDADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEP_CIDADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_ESTADO'
            Visible = True
          end>
      end
    end
  end
  object FDQuery1: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'SELECT * FROM CIDADE'
      'WHERE NOME_CIDADE LIKE :NOME_CIDADE')
    Left = 400
    Top = 304
    ParamData = <
      item
        Name = 'NOME_CIDADE'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
    object FDQuery1ID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1NOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Origin = 'NOME_CIDADE'
      Required = True
      Size = 50
    end
    object FDQuery1CEP_CIDADE: TStringField
      FieldName = 'CEP_CIDADE'
      Origin = 'CEP_CIDADE'
      Size = 10
    end
    object FDQuery1ID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      Origin = 'ID_ESTADO'
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 504
    Top = 304
  end
  object FDQuery2: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select max(id_cidade) from cidade')
    Left = 216
    Top = 304
    object FDQuery2MAX: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MAX'
      Origin = '"MAX"'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
