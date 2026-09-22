import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../modelos/ator.dart';
import '../servicos/servico_json.dart';
import 'tela_detalhes_ator.dart';

class TelaElenco extends StatelessWidget {
  TelaElenco({super.key});
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
      appBar: AppBar(title: const Text('Elenco')),
      body: FutureBuilder<List<Ator>>(
        future: servico.carregarElenco(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text('Não foi possível carregar o elenco.'));
          }

          final List<Ator> lista = snapshot.data!;

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 390),
                child: Column(
                  children: lista.map((ator) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(ator.imagem),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              ator.nome,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(ator.personagem, textAlign: TextAlign.center),
                            const SizedBox(height: 12),
                            Text(ator.descricao, textAlign: TextAlign.center),
                            const SizedBox(height: 10),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 6,
                              children: [
                                TextButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => TelaDetalhesAtor(ator: ator),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.person),
                                  label: const Text('Ver detalhes'),
                                ),
                                if (ator.possuiSiteOficial())
                                  TextButton.icon(
                                    onPressed: () => abrirSite(ator.siteOficial!),
                                    icon: const Icon(Icons.language),
                                    label: const Text('Site oficial'),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
