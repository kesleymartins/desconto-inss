# Desconto-INSS
Avaliação técnica de expressão e estilo.

## Dependências

- Docker

## Configuração

```
# Setup da aplicação
sh docker compose up -d --build

# Setup do banco de dados
docker exec di-app rails db:setup

# Polula o banco de dados com informações
docker exec di-app rails db:seed
```
