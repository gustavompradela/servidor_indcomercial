inherited ServicesUsuario: TServicesUsuario
  inherited FDConnection: TFDConnection
    Connected = True
  end
  inherited qryPesquisa: TFDQuery
    SQL.Strings = (
      
        'SELECT COD_USUARIO, NOME_USUARIO, NOME, SENHA, MASTER, MASTER_ES' +
        'TOQUE, GERENTE_VENDA, GERENTE_FINANCEIRO,'
      
        'MOBILE, GERENTE_ESTOQUE, SITUACAO, CANCELAR_VENDA, CANCELAR_VEND' +
        'A_ITEM, ALTERAR_VENDA_ITEM, PAUSAR_VENDA,'
      
        'CREDIARIO_LIBERAR, GERENTE_COMPRA, VASILHAME_LIBERAR FROM PRIV_U' +
        'SUARIO'
      'WHERE 1 = 1')
    object qryPesquisaCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryPesquisaNOME_USUARIO: TStringField
      FieldName = 'NOME_USUARIO'
      Origin = 'NOME_USUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qryPesquisaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qryPesquisaMASTER: TStringField
      FieldName = 'MASTER'
      Origin = 'MASTER'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object qryPesquisaMASTER_ESTOQUE: TSmallintField
      FieldName = 'MASTER_ESTOQUE'
      Origin = 'MASTER_ESTOQUE'
      ProviderFlags = [pfInUpdate]
    end
    object qryPesquisaGERENTE_VENDA: TSmallintField
      FieldName = 'GERENTE_VENDA'
      Origin = 'GERENTE_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object qryPesquisaGERENTE_FINANCEIRO: TSmallintField
      FieldName = 'GERENTE_FINANCEIRO'
      Origin = 'GERENTE_FINANCEIRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryPesquisaMOBILE: TSmallintField
      FieldName = 'MOBILE'
      Origin = 'MOBILE'
      ProviderFlags = [pfInUpdate]
    end
    object qryPesquisaGERENTE_ESTOQUE: TSmallintField
      FieldName = 'GERENTE_ESTOQUE'
      Origin = 'GERENTE_ESTOQUE'
      ProviderFlags = [pfInUpdate]
    end
    object qryPesquisaSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
    end
    object qryPesquisaCANCELAR_VENDA: TSmallintField
      FieldName = 'CANCELAR_VENDA'
      Origin = 'CANCELAR_VENDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPesquisaCANCELAR_VENDA_ITEM: TSmallintField
      FieldName = 'CANCELAR_VENDA_ITEM'
      Origin = 'CANCELAR_VENDA_ITEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPesquisaALTERAR_VENDA_ITEM: TSmallintField
      FieldName = 'ALTERAR_VENDA_ITEM'
      Origin = 'ALTERAR_VENDA_ITEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPesquisaPAUSAR_VENDA: TSmallintField
      FieldName = 'PAUSAR_VENDA'
      Origin = 'PAUSAR_VENDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPesquisaCREDIARIO_LIBERAR: TSmallintField
      FieldName = 'CREDIARIO_LIBERAR'
      Origin = 'CREDIARIO_LIBERAR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPesquisaGERENTE_COMPRA: TSmallintField
      FieldName = 'GERENTE_COMPRA'
      Origin = 'GERENTE_COMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object qryPesquisaVASILHAME_LIBERAR: TSmallintField
      FieldName = 'VASILHAME_LIBERAR'
      Origin = 'VASILHAME_LIBERAR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  inherited qryRecordCount: TFDQuery
    SQL.Strings = (
      'SELECT COUNT(COD_USUARIO) FROM PRIV_USUARIO WHERE 1 = 1')
  end
  inherited qryCadastro: TFDQuery
    SQL.Strings = (
      
        'SELECT COD_USUARIO, NOME_USUARIO, NOME, SENHA, MASTER, MASTER_ES' +
        'TOQUE, GERENTE_VENDA, GERENTE_FINANCEIRO,'
      
        'MOBILE, GERENTE_ESTOQUE, SITUACAO, CANCELAR_VENDA, CANCELAR_VEND' +
        'A_ITEM, ALTERAR_VENDA_ITEM, PAUSAR_VENDA,'
      
        'CREDIARIO_LIBERAR, GERENTE_COMPRA, VASILHAME_LIBERAR FROM PRIV_U' +
        'SUARIO')
    object qryCadastroCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'COD_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryCadastroNOME_USUARIO: TStringField
      FieldName = 'NOME_USUARIO'
      Origin = 'NOME_USUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qryCadastroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qryCadastroSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qryCadastroMASTER: TStringField
      FieldName = 'MASTER'
      Origin = 'MASTER'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object qryCadastroMASTER_ESTOQUE: TSmallintField
      FieldName = 'MASTER_ESTOQUE'
      Origin = 'MASTER_ESTOQUE'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroGERENTE_VENDA: TSmallintField
      FieldName = 'GERENTE_VENDA'
      Origin = 'GERENTE_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroGERENTE_FINANCEIRO: TSmallintField
      FieldName = 'GERENTE_FINANCEIRO'
      Origin = 'GERENTE_FINANCEIRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroMOBILE: TSmallintField
      FieldName = 'MOBILE'
      Origin = 'MOBILE'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroGERENTE_ESTOQUE: TSmallintField
      FieldName = 'GERENTE_ESTOQUE'
      Origin = 'GERENTE_ESTOQUE'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCANCELAR_VENDA: TSmallintField
      FieldName = 'CANCELAR_VENDA'
      Origin = 'CANCELAR_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCANCELAR_VENDA_ITEM: TSmallintField
      FieldName = 'CANCELAR_VENDA_ITEM'
      Origin = 'CANCELAR_VENDA_ITEM'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroALTERAR_VENDA_ITEM: TSmallintField
      FieldName = 'ALTERAR_VENDA_ITEM'
      Origin = 'ALTERAR_VENDA_ITEM'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroPAUSAR_VENDA: TSmallintField
      FieldName = 'PAUSAR_VENDA'
      Origin = 'PAUSAR_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCREDIARIO_LIBERAR: TSmallintField
      FieldName = 'CREDIARIO_LIBERAR'
      Origin = 'CREDIARIO_LIBERAR'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroGERENTE_COMPRA: TSmallintField
      FieldName = 'GERENTE_COMPRA'
      Origin = 'GERENTE_COMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroVASILHAME_LIBERAR: TSmallintField
      FieldName = 'VASILHAME_LIBERAR'
      Origin = 'VASILHAME_LIBERAR'
      ProviderFlags = [pfInUpdate]
    end
  end
end
