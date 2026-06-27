unit Services.Almoxarifado;

interface

uses
  System.SysUtils, System.Classes, Providers.Cadastro, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.IBBase, System.Generics.Collections;

type
  TServiceAlmoxarifado = class(TProvidersCadastro)
    qryPesquisaCOD_ALMOXARIFADO: TIntegerField;
    qryPesquisaNOME: TStringField;
    qryPesquisaLOCALIZACAO: TStringField;
    qryPesquisaSITUACAO: TSmallintField;
    qryCadastroCOD_ALMOXARIFADO: TIntegerField;
    qryCadastroNOME: TStringField;
    qryCadastroLOCALIZACAO: TStringField;
    qryCadastroSITUACAO: TSmallintField;
  protected
    function GetCamposObrigatorios: TArray<TCampoValidacao>; override;
    function GetCamposServidor: TArray<string>; override;
  private
    function GetCampoChave: String; override;
  public
    function ListAll(const AParams: TDictionary<string, string>): TFDQuery; override;
  end;

var
  ServiceAlmoxarifado: TServiceAlmoxarifado;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TServiceAlmoxarifado }

function TServiceAlmoxarifado.GetCampoChave: String;
begin
  Result := 'COD_ALMOXARIFADO';
end;

function TServiceAlmoxarifado.GetCamposObrigatorios: TArray<TCampoValidacao>;
begin
  Result := [
    TCampoValidacao.New('NOME', tcTexto)
  ];
end;

function TServiceAlmoxarifado.GetCamposServidor: TArray<string>;
begin
  Result := [];
end;

function TServiceAlmoxarifado.ListAll(const AParams: TDictionary<string, string>): TFDQuery;
begin
  if AParams.ContainsKey('NOME') then
  begin
    qryPesquisa.SQL.Add('AND UPPER(NOME) like :NOME');
    qryPesquisa.ParamByName('NOME').AsString := '%' + AParams.Items['NOME'].ToUpper + '%';
    qryRecordCount.SQL.Add('AND UPPER(NOME) like :NOME');
    qryRecordCount.ParamByName('NOME').AsString := '%' + AParams.Items['NOME'].ToUpper + '%';
  end;

  if AParams.ContainsKey('SITUACAO') then
  begin
    qryPesquisa.SQL.Add('AND SITUACAO = :SITUACAO');
    qryPesquisa.ParamByName('SITUACAO').AsString := AParams.Items['SITUACAO'];
    qryRecordCount.SQL.Add('AND SITUACAO = :SITUACAO');
    qryRecordCount.ParamByName('SITUACAO').AsString := AParams.Items['SITUACAO'];
  end;

  qryPesquisa.SQL.Add('ORDER BY COD_ALMOXARIFADO');
  Result := inherited ListAll(AParams);
end;

end.
