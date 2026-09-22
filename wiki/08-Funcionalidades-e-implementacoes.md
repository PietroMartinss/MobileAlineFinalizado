# Funcionalidades e implementações

## Navegação simples

A `TelaInicial` utiliza `Navigator.push` para abrir as telas de Informações, Elenco e Equipe.

## Navegação com parâmetros

Na `TelaElenco`, cada item possui o botão **Ver detalhes**. Ao tocar nele, o objeto `Ator` selecionado é enviado para `TelaDetalhesAtor` pelo construtor.

```dart
TelaDetalhesAtor(ator: ator)
```

Assim, a tela de detalhes mostra os dados do objeto selecionado sem precisar procurar novamente o ator no JSON.

## Listas com JSON

Os três arquivos de dados são listas JSON. `ServicoJson` converte cada item em um objeto Dart utilizando os métodos `fromJson()`.

## Navegação externa

O pacote `url_launcher` é utilizado para abrir o site oficial do filme e, quando disponível no JSON, o site oficial de um artista.

## Orientação a objetos

O projeto possui as classes `Filme`, `Ator`, `Equipe` e `ServicoJson`. Os dados são encapsulados em objetos e utilizados pelos Widgets das telas.

## Assets

As imagens ficam em `assets/images/` e os arquivos JSON em `assets/data/`. Ambos os diretórios estão declarados no `pubspec.yaml`.

## Prints e vídeo

Para a entrega final, adicionar os prints reais das cinco telas e um vídeo da navegação completa. Esses materiais dependem da execução do aplicativo em um emulador ou aparelho.
