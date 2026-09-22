# Classes e objetos

## Filme
Representa os dados gerais do filme. Possui atributos técnicos, listas de informações e links.

Método principal: `Filme.fromJson()`.

## Ator
Representa uma pessoa do elenco.

Métodos: `Ator.fromJson()` e `possuiSiteOficial()`.

## Equipe
Representa um profissional da equipe técnica.

Método: `Equipe.fromJson()`.

## ServicoJson
Carrega os três arquivos JSON:
- `carregarFilme()`
- `carregarElenco()`
- `carregarEquipe()`
