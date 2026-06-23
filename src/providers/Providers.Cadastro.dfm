inherited ProvidersCadastro: TProvidersCadastro
  Height = 241
  Width = 655
  inherited FDConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=Indcomercial')
  end
  object qryPesquisa: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    Left = 561
    Top = 56
  end
  object qryRecordCount: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    Left = 425
    Top = 56
    object qryRecordCountCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
  end
  object qryCadastro: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    Left = 289
    Top = 56
  end
end
