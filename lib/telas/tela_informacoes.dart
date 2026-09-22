import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../modelos/filme.dart';
import '../servicos/servico_json.dart';

class TelaInformacoes extends StatelessWidget {
  TelaInformacoes({super.key});
  final ServicoJson servico = ServicoJson();

  Future<void> abrirSite(String endereco) async {
    final uri = Uri.parse(endereco);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Filme>>(
        future: servico.carregarFilmes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Não foi possível carregar as informações.'),
            );
          }

          final Filme filme = snapshot.data!.first;

          return DefaultTabController(
            length: 5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                  child: Column(
                    children: [
                      Image.asset(
                        filme.imagem,
                        height: 170,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        filme.titulo,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${filme.ano} • ${filme.duracao} minutos',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.center,
                  tabs: [
                    Tab(text: 'Enredo'),
                    Tab(text: 'Dados técnicos'),
                    Tab(text: 'História'),
                    Tab(text: 'Produção'),
                    Tab(text: 'Curiosidades'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _abaEnredo(filme),
                      _abaDadosTecnicos(filme),
                      _abaHistoria(filme),
                      _abaProducao(filme, context),
                      _abaCuriosidades(filme),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _conteudoCentralizado(Widget child) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 30),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 390),
          child: child,
        ),
      ),
    );
  }

  Widget _titulo(String texto) {
    return Text(
      texto,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _abaEnredo(Filme filme) {
    return _conteudoCentralizado(
      Column(
        children: [
          _titulo('Enredo'),
          const SizedBox(height: 18),
          Text(
            filme.sinopse,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 17, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _abaDadosTecnicos(Filme filme) {
    final dados = <String>[
      'Ano: ${filme.ano}',
      'Duração: ${filme.duracao} minutos',
      'Gênero: ${filme.genero}',
      'Diretor: ${filme.diretor}',
      'Roteiro: ${filme.roteiro}',
      'Direção de fotografia: ${filme.diretorFotografia}',
      'Edição: ${filme.editor}',
      'Casting: ${filme.diretoraCasting}',
      'Design de produção: ${filme.designerProducao}',
      'Compositor: ${filme.compositor}',
    ];

    return _conteudoCentralizado(
      Column(
        children: [
          _titulo('Dados técnicos'),
          const SizedBox(height: 18),
          ...dados.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                item,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _abaHistoria(Filme filme) {
    return _conteudoCentralizado(
      Column(
        children: [
          _titulo('História'),
          const SizedBox(height: 18),
          ...filme.historia.map(
            (nome) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Text(
                nome,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 17),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _abaProducao(Filme filme, BuildContext context) {
    return _conteudoCentralizado(
      Column(
        children: [
          _titulo('Produção'),
          const SizedBox(height: 18),
          const Text(
            'Produtores',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...filme.produtores.map(
            (nome) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(nome, textAlign: TextAlign.center),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Produtores executivos',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...filme.produtoresExecutivos.map(
            (nome) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(nome, textAlign: TextAlign.center),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Figurino',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...filme.figurinistas.map(
            (nome) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(nome, textAlign: TextAlign.center),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Maquiagem',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...filme.maquiagem.map(
            (nome) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(nome, textAlign: TextAlign.center),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => abrirSite(filme.siteOficial),
              icon: const Icon(Icons.language),
              label: const Text('Site oficial do filme'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _abaCuriosidades(Filme filme) {
    return _conteudoCentralizado(
      Column(
        children: [
          _titulo('Curiosidades'),
          const SizedBox(height: 18),
          ...filme.curiosidades.map(
            (curiosidade) => Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Text(
                curiosidade,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, height: 1.45),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
