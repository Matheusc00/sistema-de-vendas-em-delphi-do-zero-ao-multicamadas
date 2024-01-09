object ModelCidadesDM: TModelCidadesDM
  OldCreateOrder = False
  Height = 150
  Width = 215
  object QCidadesCadastro: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'select * from cidades')
    Left = 24
    Top = 8
    object QCidadesCadastroID: TFDAutoIncField
      FieldName = 'C'#243'digo'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QCidadesCadastroNome: TWideStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 50
    end
    object QCidadesCadastroUF: TWideStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object QCidadesCadastroCodigo_IBGE: TIntegerField
      DisplayLabel = 'C'#243'digo IBGE'
      FieldName = 'C'#243'digo_IBGE'
      Origin = 'Codigo_IBGE'
    end
  end
  object QCidadesBusca: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'select * from cidades')
    Left = 128
    Top = 16
    object QCidadesBuscaID: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QCidadesBuscaNome: TWideStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 50
    end
    object QCidadesBuscaUF: TWideStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object QCidadesBuscaCodigo_IBGE: TIntegerField
      DisplayLabel = 'C'#243'digo IBGE'
      FieldName = 'Codigo_IBGE'
      Origin = 'Codigo_IBGE'
    end
  end
end
