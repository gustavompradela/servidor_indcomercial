inherited ServiceProduto: TServiceProduto
  Height = 315
  Width = 703
  inherited FDConnection: TFDConnection
    Connected = True
  end
  inherited qryPesquisa: TFDQuery
    SQL.Strings = (
      
        'SELECT P.COD_PRODUTO, P.COD_GRUPO, P.COD_MARCA, P.COD_COR, P.NOM' +
        'E,  P.COD_UNIDADE_ENTRADA, P.COD_UNIDADE_SAIDA, (P.CONVERSAO+0) ' +
        'AS CONVERSAO, P.TIPO_CONVERSAO, '
      ' P.PRODUTO_BALANCA, P.SITUACAO, P.TIPO_PRODUTO, '
      
        'P.DT_SITUACAO, G.COD_EXIBICAO, G.NOME AS GRUPO, C.NOME AS COR, M' +
        '.NOME AS MARCA, UE.NOME AS UNIDADE_ENTRADA, US.NOME AS UNIDADE_S' +
        'AIDA, '
      'GG.COD_GRUPO AS COD_GRUPO_PAI, GG.NOME AS GRUPO_PAI,'
      
        'GG.COD_EXIBICAO AS COD_EXIBICAO_PAI, GNCM.NCM, P.COD_GRUPO_NCM, ' +
        'GNCM.NOME AS GRUPO_NCM, P.COD_UNIDADE_NF, UNF.NOME AS UNIDADE_NF' +
        ', P.IMPRIMIR_TABELA_PRECO, (P.COMISSAO+0) AS COMISSAO, (P.MINIMO' +
        '_FATURAMENTO+0) AS MINIMO_FATURAMENTO,'
      
        'P.USA_GRADE, P.COD_GRADE, P.USA_CARGA, P.COD_UNIDADE_CARGA, P.TI' +
        'PO_CONVERSAO_CARGA, P.CONVERSAO_CARGA, UNC.NOME AS UNIDADE_CARGA' +
        ', (P.COMISSAO_ABAIXO+0) AS COMISSAO_ABAIXO, P.OBSERVACAO,'
      
        'P.ATUALIZAR, P.COD_GRUPO_CEST, GC.CEST, GC.NOME AS GRUPO_CEST, P' +
        '.COD_BARRAS, P.EXIBIR_VENDA, P.EXIBIR_PONTO_VENDA, P.EXIBIR_FORC' +
        'A_VENDA FROM PRODUTO P'
      'LEFT JOIN GRUPO G ON G.COD_GRUPO = P.COD_GRUPO'
      
        'LEFT JOIN MARCA M ON M.COD_MARCA = P.COD_MARCA LEFT JOIN COR C O' +
        'N C.COD_COR = P.COD_COR'
      
        'LEFT JOIN UNIDADE_MEDIDA UE ON UE.COD_UNIDADE_MEDIDA = P.COD_UNI' +
        'DADE_ENTRADA'
      
        'LEFT JOIN UNIDADE_MEDIDA US ON US.COD_UNIDADE_MEDIDA = P.COD_UNI' +
        'DADE_SAIDA'
      'LEFT JOIN GRUPO GG ON GG.COD_GRUPO = G.COD_JUNCAO'
      'LEFT JOIN GRUPO_NCM GNCM ON GNCM.COD_GRUPO_NCM = P.COD_GRUPO_NCM'
      
        'LEFT JOIN UNIDADE_MEDIDA UNF ON UNF.COD_UNIDADE_MEDIDA = P.COD_U' +
        'NIDADE_NF'
      
        'LEFT JOIN UNIDADE_MEDIDA UNC ON UNC.COD_UNIDADE_MEDIDA = P.COD_U' +
        'NIDADE_CARGA'
      'LEFT JOIN GRUPO_CEST GC ON GC.COD_GRUPO_CEST = P.COD_GRUPO_CEST'
      
        'LEFT JOIN PRODUTO PEMB ON PEMB.COD_PRODUTO = P.COD_EMBALAGEM_COL' +
        'ETIVA'
      'WHERE 1 = 1')
    object qryPesquisaCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = 'P.COD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryPesquisaCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = 'COD_GRUPO'
    end
    object qryPesquisaCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
      Origin = 'COD_MARCA'
    end
    object qryPesquisaCOD_COR: TIntegerField
      FieldName = 'COD_COR'
      Origin = 'COD_COR'
    end
    object qryPesquisaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'P.NOME'
      Size = 60
    end
    object qryPesquisaCOD_UNIDADE_ENTRADA: TStringField
      FieldName = 'COD_UNIDADE_ENTRADA'
      Origin = 'COD_UNIDADE_ENTRADA'
      Size = 10
    end
    object qryPesquisaCOD_UNIDADE_SAIDA: TStringField
      FieldName = 'COD_UNIDADE_SAIDA'
      Origin = 'COD_UNIDADE_SAIDA'
      Size = 10
    end
    object qryPesquisaCONVERSAO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'CONVERSAO'
      Origin = 'CONVERSAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPesquisaTIPO_CONVERSAO: TStringField
      FieldName = 'TIPO_CONVERSAO'
      Origin = 'TIPO_CONVERSAO'
      Size = 1
    end
    object qryPesquisaPRODUTO_BALANCA: TStringField
      FieldName = 'PRODUTO_BALANCA'
      Origin = 'PRODUTO_BALANCA'
      Size = 5
    end
    object qryPesquisaSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
    end
    object qryPesquisaTIPO_PRODUTO: TSmallintField
      FieldName = 'TIPO_PRODUTO'
      Origin = 'TIPO_PRODUTO'
    end
    object qryPesquisaDT_SITUACAO: TSQLTimeStampField
      FieldName = 'DT_SITUACAO'
      Origin = 'DT_SITUACAO'
    end
    object qryPesquisaCOD_EXIBICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COD_EXIBICAO'
      Origin = 'COD_EXIBICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object qryPesquisaGRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GRUPO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryPesquisaCOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COR'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qryPesquisaMARCA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MARCA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryPesquisaUNIDADE_ENTRADA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE_ENTRADA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPesquisaUNIDADE_SAIDA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE_SAIDA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPesquisaCOD_GRUPO_PAI: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_GRUPO_PAI'
      Origin = 'COD_GRUPO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPesquisaGRUPO_PAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GRUPO_PAI'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryPesquisaCOD_EXIBICAO_PAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COD_EXIBICAO_PAI'
      Origin = 'COD_EXIBICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object qryPesquisaNCM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NCM'
      Origin = 'NCM'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPesquisaCOD_GRUPO_NCM: TIntegerField
      FieldName = 'COD_GRUPO_NCM'
      Origin = 'COD_GRUPO_NCM'
    end
    object qryPesquisaGRUPO_NCM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GRUPO_NCM'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object qryPesquisaCOD_UNIDADE_NF: TStringField
      FieldName = 'COD_UNIDADE_NF'
      Origin = 'COD_UNIDADE_NF'
      Size = 10
    end
    object qryPesquisaUNIDADE_NF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE_NF'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPesquisaIMPRIMIR_TABELA_PRECO: TSmallintField
      FieldName = 'IMPRIMIR_TABELA_PRECO'
      Origin = 'IMPRIMIR_TABELA_PRECO'
    end
    object qryPesquisaCOMISSAO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'COMISSAO'
      Origin = 'COMISSAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPesquisaMINIMO_FATURAMENTO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'MINIMO_FATURAMENTO'
      Origin = 'MINIMO_FATURAMENTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPesquisaUSA_GRADE: TSmallintField
      FieldName = 'USA_GRADE'
      Origin = 'USA_GRADE'
    end
    object qryPesquisaCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Origin = 'COD_GRADE'
    end
    object qryPesquisaUSA_CARGA: TSmallintField
      FieldName = 'USA_CARGA'
      Origin = 'USA_CARGA'
    end
    object qryPesquisaCOD_UNIDADE_CARGA: TStringField
      FieldName = 'COD_UNIDADE_CARGA'
      Origin = 'COD_UNIDADE_CARGA'
      Size = 10
    end
    object qryPesquisaTIPO_CONVERSAO_CARGA: TStringField
      FieldName = 'TIPO_CONVERSAO_CARGA'
      Origin = 'TIPO_CONVERSAO_CARGA'
      Size = 1
    end
    object qryPesquisaCONVERSAO_CARGA: TFloatField
      FieldName = 'CONVERSAO_CARGA'
      Origin = 'CONVERSAO_CARGA'
    end
    object qryPesquisaUNIDADE_CARGA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE_CARGA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPesquisaCOMISSAO_ABAIXO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'COMISSAO_ABAIXO'
      Origin = 'COMISSAO_ABAIXO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPesquisaOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object qryPesquisaATUALIZAR: TSmallintField
      FieldName = 'ATUALIZAR'
      Origin = 'ATUALIZAR'
    end
    object qryPesquisaCOD_GRUPO_CEST: TIntegerField
      FieldName = 'COD_GRUPO_CEST'
      Origin = 'COD_GRUPO_CEST'
    end
    object qryPesquisaCEST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEST'
      Origin = 'CEST'
      ProviderFlags = []
      ReadOnly = True
      Size = 7
    end
    object qryPesquisaGRUPO_CEST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GRUPO_CEST'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 600
    end
    object qryPesquisaCOD_BARRAS: TStringField
      FieldName = 'COD_BARRAS'
      Origin = 'COD_BARRAS'
      Size = 30
    end
    object qryPesquisaEXIBIR_VENDA: TSmallintField
      FieldName = 'EXIBIR_VENDA'
      Origin = 'EXIBIR_VENDA'
      Required = True
    end
    object qryPesquisaEXIBIR_PONTO_VENDA: TSmallintField
      FieldName = 'EXIBIR_PONTO_VENDA'
      Origin = 'EXIBIR_PONTO_VENDA'
      Required = True
    end
    object qryPesquisaEXIBIR_FORCA_VENDA: TSmallintField
      FieldName = 'EXIBIR_FORCA_VENDA'
      Origin = 'EXIBIR_FORCA_VENDA'
      Required = True
    end
  end
  inherited qryRecordCount: TFDQuery
    SQL.Strings = (
      'SELECT COUNT(P.COD_PRODUTO) FROM PRODUTO P'
      'WHERE 1 = 1')
    Left = 441
  end
  inherited qryCadastro: TFDQuery
    SQL.Strings = (
      
        'SELECT COD_PRODUTO, COD_EMBALAGEM_COLETIVA, COD_GRUPO, COD_GRADE' +
        ', COD_MEDIDA, COD_GRUPO_NCM, COD_MARCA, COD_COR, COD_REFERENCIA,' +
        ' EXIBIR_VENDA,'
      
        '  NOME, EXIBIR_FORCA_VENDA, NOME_PDV, EXIBIR_PONTO_VENDA, COD_UN' +
        'IDADE_ENTRADA, COD_UNIDADE_SAIDA, NOME_NF, CONVERSAO, TIPO_CONVE' +
        'RSAO,'
      
        '  PRODUTO_BALANCA,  SITUACAO, TIPO_PRODUTO, ETIQUETA_ESPECIAL, D' +
        'T_CADASTRO, DESCONTO_PERMITIDO, IMAGEM,'
      
        '  DESCONTO_MAXIMO, USA_ETIQUETA, DT_SITUACAO, USA_DIMENSAO, COD_' +
        'PLANO_CREDITO, COD_PLANO_DEBITO,'
      
        '  USA_LOTE, COD_ACESSO, VASILHAME_RETORNAVEL, COD_BARRAS, COD_UN' +
        'IDADE_NF, IMPRIMIR_TABELA_PRECO, USA_NUMERO_SERIAL,'
      
        '  COMISSAO, MINIMO_FATURAMENTO, USA_GRADE, LIBERA_NOME, USA_CARG' +
        'A, COD_UNIDADE_CARGA, TIPO_CONVERSAO_CARGA,'
      
        '  CONVERSAO_CARGA, NAO_USA_ESTOQUE, COMISSAO_ABAIXO, OBSERVACAO,' +
        ' USA_CONTRATO, ATUALIZAR, USA_MEDIDA, COD_GRUPO_CEST, COD_EMPRES' +
        'A_EAN,'
      
        '  COD_BARRA_ITEM, COD_TIPO_VASILHAME, COD_GRUPO_ANP, ACRESCIMO_P' +
        'ERMITIDO, ARMAMENTO,'
      
        '  COD_PRODUTO_FORMULA, CAPACIDADE_EMBALAGEM_COLETIVA FROM PRODUT' +
        'O')
    object qryCadastroCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryCadastroCOD_EMBALAGEM_COLETIVA: TIntegerField
      FieldName = 'COD_EMBALAGEM_COLETIVA'
      Origin = 'COD_EMBALAGEM_COLETIVA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = 'COD_GRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Origin = 'COD_GRADE'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOD_MEDIDA: TIntegerField
      FieldName = 'COD_MEDIDA'
      Origin = 'COD_MEDIDA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOD_GRUPO_NCM: TIntegerField
      FieldName = 'COD_GRUPO_NCM'
      Origin = 'COD_GRUPO_NCM'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
      Origin = 'COD_MARCA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOD_COR: TIntegerField
      FieldName = 'COD_COR'
      Origin = 'COD_COR'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOD_REFERENCIA: TStringField
      FieldName = 'COD_REFERENCIA'
      Origin = 'COD_REFERENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroEXIBIR_VENDA: TSmallintField
      FieldName = 'EXIBIR_VENDA'
      Origin = 'EXIBIR_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qryCadastroEXIBIR_FORCA_VENDA: TSmallintField
      FieldName = 'EXIBIR_FORCA_VENDA'
      Origin = 'EXIBIR_FORCA_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroNOME_PDV: TStringField
      FieldName = 'NOME_PDV'
      Origin = 'NOME_PDV'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qryCadastroEXIBIR_PONTO_VENDA: TSmallintField
      FieldName = 'EXIBIR_PONTO_VENDA'
      Origin = 'EXIBIR_PONTO_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOD_UNIDADE_ENTRADA: TStringField
      FieldName = 'COD_UNIDADE_ENTRADA'
      Origin = 'COD_UNIDADE_ENTRADA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qryCadastroCOD_UNIDADE_SAIDA: TStringField
      FieldName = 'COD_UNIDADE_SAIDA'
      Origin = 'COD_UNIDADE_SAIDA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qryCadastroNOME_NF: TStringField
      FieldName = 'NOME_NF'
      Origin = 'NOME_NF'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qryCadastroCONVERSAO: TFloatField
      FieldName = 'CONVERSAO'
      Origin = 'CONVERSAO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroTIPO_CONVERSAO: TStringField
      FieldName = 'TIPO_CONVERSAO'
      Origin = 'TIPO_CONVERSAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qryCadastroPRODUTO_BALANCA: TStringField
      FieldName = 'PRODUTO_BALANCA'
      Origin = 'PRODUTO_BALANCA'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object qryCadastroSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroTIPO_PRODUTO: TSmallintField
      FieldName = 'TIPO_PRODUTO'
      Origin = 'TIPO_PRODUTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroETIQUETA_ESPECIAL: TStringField
      FieldName = 'ETIQUETA_ESPECIAL'
      Origin = 'ETIQUETA_ESPECIAL'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object qryCadastroDT_CADASTRO: TSQLTimeStampField
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroDESCONTO_PERMITIDO: TFloatField
      FieldName = 'DESCONTO_PERMITIDO'
      Origin = 'DESCONTO_PERMITIDO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroDESCONTO_MAXIMO: TFloatField
      FieldName = 'DESCONTO_MAXIMO'
      Origin = 'DESCONTO_MAXIMO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroUSA_ETIQUETA: TStringField
      FieldName = 'USA_ETIQUETA'
      Origin = 'USA_ETIQUETA'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object qryCadastroDT_SITUACAO: TSQLTimeStampField
      FieldName = 'DT_SITUACAO'
      Origin = 'DT_SITUACAO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroUSA_DIMENSAO: TStringField
      FieldName = 'USA_DIMENSAO'
      Origin = 'USA_DIMENSAO'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object qryCadastroCOD_PLANO_CREDITO: TIntegerField
      FieldName = 'COD_PLANO_CREDITO'
      Origin = 'COD_PLANO_CREDITO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOD_PLANO_DEBITO: TIntegerField
      FieldName = 'COD_PLANO_DEBITO'
      Origin = 'COD_PLANO_DEBITO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroUSA_LOTE: TStringField
      FieldName = 'USA_LOTE'
      Origin = 'USA_LOTE'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object qryCadastroCOD_ACESSO: TStringField
      FieldName = 'COD_ACESSO'
      Origin = 'COD_ACESSO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroVASILHAME_RETORNAVEL: TSmallintField
      FieldName = 'VASILHAME_RETORNAVEL'
      Origin = 'VASILHAME_RETORNAVEL'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOD_BARRAS: TStringField
      FieldName = 'COD_BARRAS'
      Origin = 'COD_BARRAS'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qryCadastroCOD_UNIDADE_NF: TStringField
      FieldName = 'COD_UNIDADE_NF'
      Origin = 'COD_UNIDADE_NF'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qryCadastroIMPRIMIR_TABELA_PRECO: TSmallintField
      FieldName = 'IMPRIMIR_TABELA_PRECO'
      Origin = 'IMPRIMIR_TABELA_PRECO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroUSA_NUMERO_SERIAL: TIntegerField
      FieldName = 'USA_NUMERO_SERIAL'
      Origin = 'USA_NUMERO_SERIAL'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      Origin = 'COMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroMINIMO_FATURAMENTO: TFloatField
      FieldName = 'MINIMO_FATURAMENTO'
      Origin = 'MINIMO_FATURAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroUSA_GRADE: TSmallintField
      FieldName = 'USA_GRADE'
      Origin = 'USA_GRADE'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroLIBERA_NOME: TSmallintField
      FieldName = 'LIBERA_NOME'
      Origin = 'LIBERA_NOME'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroUSA_CARGA: TSmallintField
      FieldName = 'USA_CARGA'
      Origin = 'USA_CARGA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOD_UNIDADE_CARGA: TStringField
      FieldName = 'COD_UNIDADE_CARGA'
      Origin = 'COD_UNIDADE_CARGA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qryCadastroTIPO_CONVERSAO_CARGA: TStringField
      FieldName = 'TIPO_CONVERSAO_CARGA'
      Origin = 'TIPO_CONVERSAO_CARGA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qryCadastroCONVERSAO_CARGA: TFloatField
      FieldName = 'CONVERSAO_CARGA'
      Origin = 'CONVERSAO_CARGA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroNAO_USA_ESTOQUE: TSmallintField
      FieldName = 'NAO_USA_ESTOQUE'
      Origin = 'NAO_USA_ESTOQUE'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOMISSAO_ABAIXO: TFloatField
      FieldName = 'COMISSAO_ABAIXO'
      Origin = 'COMISSAO_ABAIXO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object qryCadastroUSA_CONTRATO: TSmallintField
      FieldName = 'USA_CONTRATO'
      Origin = 'USA_CONTRATO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroATUALIZAR: TSmallintField
      FieldName = 'ATUALIZAR'
      Origin = 'ATUALIZAR'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroUSA_MEDIDA: TSmallintField
      FieldName = 'USA_MEDIDA'
      Origin = 'USA_MEDIDA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOD_GRUPO_CEST: TIntegerField
      FieldName = 'COD_GRUPO_CEST'
      Origin = 'COD_GRUPO_CEST'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOD_EMPRESA_EAN: TIntegerField
      FieldName = 'COD_EMPRESA_EAN'
      Origin = 'COD_EMPRESA_EAN'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOD_BARRA_ITEM: TIntegerField
      FieldName = 'COD_BARRA_ITEM'
      Origin = 'COD_BARRA_ITEM'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOD_TIPO_VASILHAME: TIntegerField
      FieldName = 'COD_TIPO_VASILHAME'
      Origin = 'COD_TIPO_VASILHAME'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOD_GRUPO_ANP: TIntegerField
      FieldName = 'COD_GRUPO_ANP'
      Origin = 'COD_GRUPO_ANP'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroACRESCIMO_PERMITIDO: TFloatField
      FieldName = 'ACRESCIMO_PERMITIDO'
      Origin = 'ACRESCIMO_PERMITIDO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroARMAMENTO: TSmallintField
      FieldName = 'ARMAMENTO'
      Origin = 'ARMAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCOD_PRODUTO_FORMULA: TIntegerField
      FieldName = 'COD_PRODUTO_FORMULA'
      Origin = 'COD_PRODUTO_FORMULA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCadastroCAPACIDADE_EMBALAGEM_COLETIVA: TFloatField
      FieldName = 'CAPACIDADE_EMBALAGEM_COLETIVA'
      Origin = 'CAPACIDADE_EMBALAGEM_COLETIVA'
      ProviderFlags = [pfInUpdate]
    end
  end
end
