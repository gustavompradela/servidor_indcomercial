object ProvidersConnection: TProvidersConnection
  Height = 216
  Width = 211
  object FDConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=server_indcomercial')
    LoginPrompt = False
    Left = 72
    Top = 40
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 72
    Top = 112
  end
end
