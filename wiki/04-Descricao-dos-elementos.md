# Descrição dos elementos

## Tela Inicial
| Elemento visual | Widget | Classe/atributo/método associado |
|---|---|---|
| Pôster | `Image.asset` | `Filme.imagem` |
| Título | `Text` | `Filme.titulo` |
| Ano | `Text` | `Filme.ano` |
| Duração | `Text` | `Filme.duracao` |
| Botão Informações | `ElevatedButton` | `Navigator.push` → `TelaInformacoes` |
| Botão Elenco | `ElevatedButton` | `Navigator.push` → `TelaElenco` |
| Botão Equipe | `ElevatedButton` | `Navigator.push` → `TelaEquipe` |

## Tela Informações
| Elemento visual | Widget | Classe/atributo/método associado |
|---|---|---|
| Pôster | `Image.asset` | `Filme.imagem` |
| Título | `Text` | `Filme.titulo` |
| Título original | `Text` | `Filme.tituloOriginal` |
| Dados técnicos | `Text` | atributos de `Filme` |
| Enredo | `Text` | `Filme.sinopse` |
| História | `Column` + `Text` | `Filme.historia` |
| Produtores | `Column` + `Text` | `Filme.produtores` |
| Produtores executivos | `Column` + `Text` | `Filme.produtoresExecutivos` |
| Figurino | `Column` + `Text` | `Filme.figurinistas` |
| Maquiagem | `Column` + `Text` | `Filme.maquiagem` |
| Curiosidades | `Column` + `Text` | `Filme.curiosidades` |
| Site oficial | `ElevatedButton.icon` | `Filme.siteOficial` + `abrirSite()` |

## Tela Elenco
| Elemento visual | Widget | Classe/atributo/método associado |
|---|---|---|
| Lista | `ListView.builder` | `List<Ator>` carregada por `ServicoJson.carregarElenco()` |
| Cartão | `Card` | objeto `Ator` |
| Foto | `CircleAvatar` | `Ator.imagem` |
| Nome | `Text` | `Ator.nome` |
| Personagem | `Text` | `Ator.personagem` |
| Descrição | `Text` | `Ator.descricao` |
| Ver detalhes | `TextButton.icon` | `Navigator.push` + parâmetro `Ator` |
| Site oficial | `TextButton.icon` | `Ator.siteOficial` + `abrirSite()` |

## Tela Detalhes do Ator
| Elemento visual | Widget | Classe/atributo/método associado |
|---|---|---|
| Foto | `CircleAvatar` | `Ator.imagem` |
| Nome | `Text` | `Ator.nome` |
| Personagem | `Text` | `Ator.personagem` |
| Descrição | `Text` | `Ator.descricao` |
| Site oficial | `ElevatedButton.icon` | `Ator.siteOficial` + `abrirSite()` |
| Parâmetro recebido | construtor | `TelaDetalhesAtor({required this.ator})` |

## Tela Equipe
| Elemento visual | Widget | Classe/atributo/método associado |
|---|---|---|
| Lista | `ListView.builder` | `List<Equipe>` carregada por `ServicoJson.carregarEquipe()` |
| Item | `ListTile` | objeto `Equipe` |
| Nome | `Text` | `Equipe.nome` |
| Função | `Text` | `Equipe.funcao` |

## Abas da tela de informações

| Elemento | Widget | Origem dos dados |
|---|---|---|
| Abas | `DefaultTabController`, `TabBar` e `TabBarView` | Estrutura da interface |
| Aba Enredo | `Text` | `Filme.sinopse` |
| Aba Dados técnicos | `Text` | Atributos do objeto `Filme` |
| Aba História | `Text` | `Filme.historia` |
| Aba Produção | `Text` e `ElevatedButton` | `produtores`, `produtoresExecutivos`, `figurinistas`, `maquiagem` e `siteOficial` do objeto `Filme` |
| Aba Curiosidades | `Text` | `Filme.curiosidades` |
