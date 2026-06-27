unit Controllers.Almoxarifado;

interface

uses Horse;

procedure RegistrarRota;

implementation

uses
  System.SysUtils, System.JSON,
  Services.Almoxarifado, Providers.Helpers, DataSet.Serialize, FireDAC.Stan.Error;

procedure ListarAlmoxarifados(Req: THorseRequest; Res: ThorseResponse; Next: TProc);
var
  LRetorno: TJSONObject;
  LService: TServiceAlmoxarifado;
begin
  LService := TServiceAlmoxarifado.Create();
  try
    LRetorno := TJSONObject.Create;
    LRetorno.AddPair('data', LService.ListAll(Req.Query.Dictionary).ToJSONArray());
    LRetorno.AddPair('records', TJSONNumber.Create(LService.GetRecordCount));
    Res.Send(LRetorno);
  finally
     LService.Free;
  end;
end;

procedure ObterAlmoxarifado(Req: THorseRequest; Res: ThorseResponse; Next: TProc);
var
  LService: TServiceAlmoxarifado;
  LId: Int64;
begin
  LService := TServiceAlmoxarifado.Create();
  try
    LId := StrToInt64Def(Req.Params.Items['id'], 0);

    if LId <= 0 then
    begin
      Res.Send(ErroJson('ID inválido')).Status(400);
      Exit;
    end;

    LService.GetById(LId);

    if LService.qryCadastro.IsEmpty then
    begin
      Res.Send(ErroJson('Almoxarifado não encontrado')).Status(404);
      Exit;
    end;

    Res.Send(LService.qryCadastro.ToJSONObject());
  finally
     LService.Free;
  end;
end;

procedure CadastrarAlmoxarifado(Req: THorseRequest; Res: ThorseResponse; Next: TProc);
var
  LService: TServiceAlmoxarifado;
  LAlmoxarifado: TJSONObject;
  LErros: TArray<string>;
begin
  try
    LAlmoxarifado := Req.Body<TJSONObject>;
  except
    on E: Exception do
    begin
      Res.Send(ErroJson('JSON inválido: ' + E.Message)).Status(400);
      Exit;
    end;
  end;

  LService := TServiceAlmoxarifado.Create();
  try
    if not LService.Validar(LAlmoxarifado, LErros) then
    begin
      Res.Send(ErroJson('Campos inválidos', LErros)).Status(400);
      Exit;
    end;

    try
      if LService.Append(LAlmoxarifado) then
        Res.Send(LService.qryCadastro.ToJSONObject()).Status(THTTPStatus.Created)
      else
        Res.Send(ErroJson('Não foi possível incluir o almoxarifado')).Status(500);
    except
      on E: EFDDBEngineException do
        Res.Send(ErroJson('Erro de banco: ' + E.Message)).Status(422);
      on E: Exception do
        Res.Send(ErroJson(E.Message)).Status(500);
    end;
  finally
     LService.Free;
  end;
end;

procedure AlterarAlmoxarifado(Req: THorseRequest; Res: ThorseResponse; Next: TProc);
var
  LService: TServiceAlmoxarifado;
  LAlmoxarifado: TJSONObject;
  LId: Int64;
  LErros: TArray<string>;
begin
  try
    LAlmoxarifado := Req.Body<TJSONObject>;
  except
    on E: Exception do
    begin
      Res.Send(ErroJson('JSON inválido: ' + E.Message)).Status(400);
      Exit;
    end;
  end;

  LService := TServiceAlmoxarifado.Create();
  try
    LId := StrToInt64Def(Req.Params.Items['id'], 0);

    if LId <= 0 then
    begin
      Res.Send(ErroJson('ID inválido')).Status(400);
      Exit;
    end;

    LService.GetById(LId);

    if LService.qryCadastro.IsEmpty then
    begin
      Res.Send(ErroJson('Almoxarifado não encontrado')).Status(404);
      Exit;
    end;

    try
      if LService.Update(LAlmoxarifado) then
        Res.Send(LService.qryCadastro.ToJSONObject()).Status(THTTPStatus.OK)
      else
        Res.Send(ErroJson('Não foi possível alterar o almoxarifado')).Status(500);
    except
      on E: EFDDBEngineException do
        Res.Send(ErroJson('Erro de banco: ' + E.Message)).Status(422);
      on E: Exception do
        Res.Send(ErroJson(E.Message)).Status(500);
    end;
  finally
     LService.Free;
  end;
end;

procedure DeletarAlmoxarifado(Req: THorseRequest; Res: ThorseResponse; Next: TProc);
var
  LService: TServiceAlmoxarifado;
  LId: Int64;
begin
  LService := TServiceAlmoxarifado.Create();
  try
    LId := StrToInt64Def(Req.Params.Items['id'], 0);

    if LId <= 0 then
    begin
      Res.Send(ErroJson('ID inválido')).Status(400);
      Exit;
    end;

    LService.GetById(LId);

    if LService.qryCadastro.IsEmpty then
    begin
      Res.Send(ErroJson('Almoxarifado não encontrado')).Status(404);
      Exit;
    end;

    if LService.Delete then
      Res.Send(TJSONObject.Create).Status(THTTPStatus.NoContent)
    else
      Res.Send(ErroJson('Não foi possível excluir o almoxarifado')).Status(500);
  finally
     LService.Free;
  end;
end;

procedure RegistrarRota;
begin
   THorse.Get('/almoxarifados', ListarAlmoxarifados);
   THorse.Get('/almoxarifados/:id', ObterAlmoxarifado);
   THorse.Post('/almoxarifados', CadastrarAlmoxarifado);
   THorse.Put('/almoxarifados/:id', AlterarAlmoxarifado);
   THorse.Delete('/almoxarifados/:id', DeletarAlmoxarifado);
end;

end.
