# Servidor IndComercial

API REST para o sistema IndComercial, construída com Horse Framework.

## Tecnologias

- Delphi 12
- Firebird 5
- Horse (v3.2.0)
- Horse-Jhonson (v1.2.1)
- Horse-CORS (v1.0.8)
- DataSet-Serialize (v2.5.9)
- Boss (gerenciador de dependências)

## Arquitetura

```
src/
  controllers/    Handlers das rotas HTTP
  services/       Regras de negócio e persistência
  providers/      Conexão com banco e base genérica CRUD
modules/          Dependências (Horse, Jhonson, etc.)
```

### Camadas

- **Controllers** — Registra rotas e manipula request/response (Horse callbacks)
- **Services** — Herdam `TProvidersCadastro`, definem campos obrigatórios, validação e lógica específica de cada entidade
- **Providers** — `Providers.Connection` (conexão Firebird) e `Providers.Cadastro` (CRUD genérico com validação por campos obrigatórios)

## Padrões

- SOLID
- Injeção de Dependência (via DataModules)
- DTOs — JSON de entrada/saída validado por campos obrigatórios tipados
- CRUD genérico — `TProvidersCadastro` implementa `Append`, `Update`, `Delete`, `ListAll`, `GetById` reutilizáveis

## Convenções

- Classes começam com `T`, interfaces começam com `I`
- SQL em classes Repository (Providers)
- Regras de negócio em Services
- Controllers contêm apenas lógica de request/response
- Arquivos nomeados no padrão `Namespace.Nome.pas` (ex: `Controllers.Produto.pas`)
- Rotas RESTful nomeadas no plural (`/produtos`, `/produtos/:id`)
- Retorno de erro padronizado: `{"error": "mensagem"}` ou `{"error": "mensagem", "details": [...]}`
- Gerenciamento de dependências via `boss.json`

## Endpoints

### Produtos

| Método | Rota                | Descrição              |
|--------|---------------------|------------------------|
| GET    | `/produtos`         | Listar produtos        |
| GET    | `/produtos/:id`     | Obter produto por ID   |
| POST   | `/produtos`         | Cadastrar produto      |
| PUT    | `/produtos/:id`     | Alterar produto        |
| DELETE | `/produtos/:id`     | Deletar produto        |

### Saúde

| Método | Rota   | Descrição     |
|--------|--------|---------------|
| GET    | `/ping`| Health check  |

## Como executar

```bash
# Instalar dependências
boss install

# Compilar e executar
dcc32 servidor_Indcomercial.dpr
# ou abrir o .dproj no Delphi e pressionar F9
```

O servidor sobe na porta **9000**.

## Exemplo de requisição

```json
POST /produtos
{
  "NOME": "Produto Teste",
  "COD_GRUPO": 1,
  "COD_MARCA": 1
}
```

Resposta de erro:

```json
{
  "error": "Campos inválidos",
  "details": ["NOME é obrigatório"]
}
```
