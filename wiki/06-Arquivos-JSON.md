# Estrutura dos arquivos JSON

Os arquivos JSON ficam em `assets/data/` e são registrados no `pubspec.yaml`. O aplicativo utiliza `rootBundle.loadString()` e `jsonDecode()` para transformar os dados em listas de objetos Dart.

## 1. filme.json

O arquivo é uma lista contendo o objeto do filme.

```json
[
  {
    "titulo": "...",
    "tituloOriginal": "...",
    "ano": 1986,
    "duracao": 101,
    "diretor": "...",
    "genero": "...",
    "sinopse": "...",
    "roteiro": "...",
    "historia": ["..."],
    "produtores": ["..."],
    "produtoresExecutivos": ["..."],
    "diretorFotografia": "...",
    "editor": "...",
    "diretoraCasting": "...",
    "designerProducao": "...",
    "figurinistas": ["..."],
    "compositor": "...",
    "maquiagem": ["..."],
    "curiosidades": ["..."],
    "imagem": "assets/images/poster.png",
    "siteOficial": "...",
    "fontes": ["..."]
  }
]
```

O objeto é criado por `Filme.fromJson()`.

## 2. elenco.json

É uma lista de objetos com: `nome`, `personagem`, `imagem`, `descricao` e, quando houver, `siteOficial`. Cada item é convertido em um objeto `Ator` por `Ator.fromJson()`.

## 3. equipe.json

É uma lista de objetos com `nome` e `funcao`. Cada item é convertido em um objeto `Equipe` por `Equipe.fromJson()`.

## Fluxo de dados

```text
Arquivo JSON
   ↓
rootBundle.loadString()
   ↓
jsonDecode()
   ↓
List<dynamic>
   ↓
fromJson()
   ↓
List<Filme> / List<Ator> / List<Equipe>
   ↓
Widgets
   ↓
Telas
```

Dessa forma, as informações do filme exibidas pelo aplicativo não são digitadas diretamente nos Widgets: elas são obtidas dos arquivos JSON e transformadas em objetos.
