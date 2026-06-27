unit Providers.Helpers;

interface

uses System.JSON;

const
  VERSAO_API = '0.0.10';
  C_PREFIX = 'v1';

function ErroJson(const AMensagem: string): TJSONObject; overload;
function ErroJson(const AMensagem: string; const ADetalhes: TArray<string>): TJSONObject; overload;

implementation

function ErroJson(const AMensagem: string): TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.AddPair('error', AMensagem);
end;

function ErroJson(const AMensagem: string; const ADetalhes: TArray<string>): TJSONObject;
var
  LArr: TJSONArray;
  LMsg: string;
begin
  LArr := TJSONArray.Create;
  for LMsg in ADetalhes do
    LArr.Add(LMsg);
  Result := TJSONObject.Create;
  Result.AddPair('error', AMensagem);
  Result.AddPair('details', LArr);
end;

end.
