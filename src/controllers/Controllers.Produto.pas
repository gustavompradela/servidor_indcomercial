unit Controllers.Produto;

interface

uses Horse;

procedure RegistrarRota;

implementation

uses
  System.SysUtils, System.JSON,
  Services.Produto, Providers.Helpers, DataSet.Serialize, FireDAC.Stan.Error;

procedure ListarProdutos(Req: THorseRequest; Res: ThorseResponse; Next: TProc);
var
  LRetorno: TJSONObject;
  LService: TServiceProduto;
begin
  LService := TServiceProduto.Create();
  try
    LRetorno := TJSONObject.Create;
    LRetorno.AddPair('data', LService.ListAll(Req.Query.Dictionary).ToJSONArray());
    LRetorno.AddPair('records', TJSONNumber.Create(LService.GetRecordCount));
    Res.Send(LRetorno);
  finally
     LService.Free;
  end;
end;

procedure ObterProduto(Req: THorseRequest; Res: ThorseResponse; Next: TProc);
var
  LService: TServiceProduto;
  LId: Int64;
begin
  LService := TServiceProduto.Create();
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
      Res.Send(ErroJson('Produto não encontrado')).Status(404);
      Exit;
    end;

    Res.Send(LService.qryCadastro.ToJSONObject());
  finally
     LService.Free;
  end;
end;

procedure CadastrarProduto(Req: THorseRequest; Res: ThorseResponse; Next: TProc);
var
  LService: TServiceProduto;
  LProduto: TJSONObject;
  LErros: TArray<string>;
begin
  try
    LProduto := Req.Body<TJSONObject>;
  except
    on E: Exception do
    begin
      Res.Send(ErroJson('JSON inválido: ' + E.Message)).Status(400);
      Exit;
    end;
  end;

  LService := TServiceProduto.Create();
  try
    if not LService.Validar(LProduto, LErros) then
    begin
      Res.Send(ErroJson('Campos inválidos', LErros)).Status(400);
      Exit;
    end;

    try
      if LService.Append(LProduto) then
        Res.Send(LService.qryCadastro.ToJSONObject()).Status(THTTPStatus.Created)
      else
        Res.Send(ErroJson('Não foi possível incluir o produto')).Status(500);
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

procedure AlterarProduto(Req: THorseRequest; Res: ThorseResponse; Next: TProc);
var
  LService: TServiceProduto;
  LProduto: TJSONObject;
  LId: Int64;
  LErros: TArray<string>;
begin
  try
    LProduto := Req.Body<TJSONObject>;
  except
    on E: Exception do
    begin
      Res.Send(ErroJson('JSON inválido: ' + E.Message)).Status(400);
      Exit;
    end;
  end;

  LService := TServiceProduto.Create();
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
      Res.Send(ErroJson('Produto não encontrado')).Status(404);
      Exit;
    end;


    try
      if LService.Update(LProduto) then
        Res.Send(LService.qryCadastro.ToJSONObject()).Status(THTTPStatus.OK)
      else
        Res.Send(ErroJson('Não foi possível alterar o produto')).Status(500);
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

procedure DeletarProduto(Req: THorseRequest; Res: ThorseResponse; Next: TProc);
var
  LService: TServiceProduto;
  LId: Int64;
begin
  LService := TServiceProduto.Create();
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
      Res.Send(ErroJson('Produto não encontrado')).Status(404);
      Exit;
    end;

    if LService.Delete then
      Res.Send(TJSONObject.Create).Status(THTTPStatus.NoContent)
    else
      Res.Send(ErroJson('Não foi possível excluir o produto')).Status(500);
  finally
     LService.Free;
  end;
end;

procedure RegistrarRota;
begin
   THorse.Get('/produtos', ListarProdutos );
   THorse.Get('/produtos/:id', ObterProduto);
   THorse.POST('/produtos', CadastrarProduto);
   THorse.Put('/produtos/:id', AlterarProduto );
   THorse.Delete('/produtos/:id', DeletarProduto);
end;

end.
