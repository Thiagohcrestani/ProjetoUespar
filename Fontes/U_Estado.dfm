inherited F_Estado: TF_Estado
  Caption = 'Cadastro de Estado'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = TabSheet2
    inherited TabSheet1: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 22
      object Label1: TLabel
        Left = 0
        Top = 43
        Width = 43
        Height = 13
        Caption = 'IdEstado'
      end
      object Label2: TLabel
        Left = 3
        Top = 94
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label3: TLabel
        Left = 3
        Top = 145
        Width = 22
        Height = 13
        Caption = 'Sigla'
      end
      object Edit1: TEdit
        Left = 70
        Top = 40
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 70
        Top = 91
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 1
        OnChange = Edit2Change
      end
      object Edit3: TEdit
        Left = 70
        Top = 142
        Width = 251
        Height = 21
        Enabled = False
        TabOrder = 2
      end
    end
    inherited TabSheet2: TTabSheet
      inherited GroupBox2: TGroupBox
        object DBGrid1: TDBGrid
          Left = 3
          Top = 31
          Width = 594
          Height = 120
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_ESTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_ESTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SIGLA_ESTADO'
              Visible = True
            end>
        end
      end
      inherited GroupBox1: TGroupBox
        object Edit4: TEdit
          Left = 24
          Top = 40
          Width = 545
          Height = 21
          TabOrder = 0
          OnChange = Edit4Change
        end
      end
    end
  end
  object FDQuery1: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'SELECT * FROM ESTADO '
      'WHERE NOME_ESTADO LIKE :NOME_ESTADO')
    Left = 321
    Top = 316
    ParamData = <
      item
        Name = 'NOME_ESTADO'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end>
    object FDQuery1ID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      Origin = 'ID_ESTADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1NOME_ESTADO: TStringField
      FieldName = 'NOME_ESTADO'
      Origin = 'NOME_ESTADO'
      Required = True
      Size = 50
    end
    object FDQuery1SIGLA_ESTADO: TStringField
      FieldName = 'SIGLA_ESTADO'
      Origin = 'SIGLA_ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 417
    Top = 316
  end
  object FDQuery2: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select max(id_estado) from estado')
    Left = 232
    Top = 320
    object FDQuery2MAX: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MAX'
      Origin = '"MAX"'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
