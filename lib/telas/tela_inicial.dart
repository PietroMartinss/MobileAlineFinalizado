import 'package:flutter/material.dart';
import '../modelos/filme.dart';
import '../servicos/servico_json.dart';
import 'tela_informacoes.dart';
import 'tela_elenco.dart';
import 'tela_equipe.dart';

class TelaInicial extends StatelessWidget {
  TelaInicial({super.key});
  final ServicoJson servico = ServicoJson();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Labirinto'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Filme>>(
        future: servico.carregarFilmes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text('Não foi possível carregar os dados do filme.'));
          }

          final Filme filme = snapshot.data!.first;

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 390),
                child: Column(
                children: [
                  Image.asset(filme.imagem, width: 600, height: 650),
                  const SizedBox(height: 20),
                  Text(
                    filme.titulo,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  Text('${filme.ano} • ${filme.duracao} minutos'),
                  const SizedBox(height: 25),
                  _botao(context, 'Informações do filme', TelaInformacoes()),
                  _botao(context, 'Elenco', TelaElenco()),
                  _botao(context, 'Equipe técnica', TelaEquipe()),
                ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _botao(BuildContext context, String titulo, Widget tela) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => tela),
            );
          },
          child: Text(titulo),
        ),
      ),
    );
  }
}
