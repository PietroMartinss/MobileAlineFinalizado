# Protótipo

O aplicativo possui cinco telas principais. A navegação foi feita com `Navigator.push`. Além da navegação simples entre as telas, o aplicativo possui **navegação com parâmetro**: ao selecionar um integrante do elenco, o objeto `Ator` é enviado para a tela `TelaDetalhesAtor`.

## Fluxo de navegação

```text
Tela Inicial
 ├── Informações do filme
 ├── Elenco
 │    └── Ver detalhes → Tela Detalhes do Ator (recebe Ator)
 │          └── Site oficial, quando existir
 └── Equipe técnica
```

## Telas

### 1. Tela Inicial
**Finalidade:** apresentar o filme e funcionar como ponto de entrada para as demais telas.

**Dados:** o pôster, título, ano e duração são obtidos do objeto `Filme`, carregado a partir de `filme.json`.

### 2. Tela Informações
**Finalidade:** apresentar enredo, dados técnicos, equipe principal, figurino, maquiagem e curiosidades.

**Dados:** todos os dados do filme são obtidos do objeto `Filme`.

### 3. Tela Elenco
**Finalidade:** apresentar uma lista dos principais integrantes do elenco, seus personagens, imagens e descrições.

**Dados:** `elenco.json` é convertido em `List<Ator>`.

### 4. Tela Detalhes do Ator
**Finalidade:** mostrar detalhadamente o integrante selecionado.

**Navegação com parâmetro:** a tela recebe `Ator ator` no construtor. O objeto selecionado na `TelaElenco` é passado para a nova tela.

Exemplo da implementação:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => TelaDetalhesAtor(ator: ator),
  ),
);
```

### 5. Tela Equipe Técnica
**Finalidade:** listar profissionais importantes que trabalharam no filme e suas funções.

**Dados:** `equipe.json` é convertido em `List<Equipe>`.

## Prints das telas

Os prints abaixo devem ser substituídos pelos prints reais do aplicativo depois que ele for executado em um emulador ou celular.

- `prints/tela-inicial.png`
- `prints/tela-informacoes.png`
- `prints/tela-elenco.png`
- `prints/tela-detalhes-ator.png`
- `prints/tela-equipe.png`

## Vídeo da navegação

A entrega também deve conter um vídeo demonstrando a navegação completa. O vídeo deve mostrar, no mínimo: Tela Inicial → Informações → Elenco → Detalhes de um ator → retorno → Equipe → abertura de um site oficial quando disponível.

O arquivo pode ser disponibilizado no GitHub ou por um link inserido nesta página.

## Atualização da tela de informações

A tela de informações foi organizada em abas para facilitar a navegação no conteúdo da obra. As abas são:

- **Enredo** — apresenta a sinopse do filme.
- **Dados técnicos** — apresenta ano, duração, gênero, direção, roteiro e outros dados técnicos.
- **História** — apresenta os responsáveis pela história da obra.
- **Produção** — apresenta produtores, produtores executivos, figurino, maquiagem e acesso ao site oficial.
- **Curiosidades** — apresenta as curiosidades carregadas do JSON.

O conteúdo é centralizado e limitado a uma largura adequada para visualização semelhante à de uma tela mobile quando executado no navegador.
