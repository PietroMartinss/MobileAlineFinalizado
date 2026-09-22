import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../modelos/ator.dart';

class TelaDetalhesAtor extends StatelessWidget {
  final Ator ator;

  const TelaDetalhesAtor({
    super.key,
    required this.ator,
  });

  Future<void> _abrirSite() async {
    if (ator.siteOficial == null || ator.siteOficial!.isEmpty) {
      return;
    }

    final uri = Uri.parse(ator.siteOficial!);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  Widget _informacao(
    String titulo,
    String? texto,
  ) {
    if (texto == null || texto.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        children: [
          Text(
            titulo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            texto,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ator.nome),
        centerTitle: true,
      ),

      body: Center(
        child: SizedBox(
          width: 390,

          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // FOTO
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    ator.imagem,
                    width: 220,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 20),

                // NOME
                Text(
                  ator.nome,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // PERSONAGEM
                Text(
                  ator.personagem,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const SizedBox(height: 25),

                // DESCRIÇÃO NO FILME
                _informacao(
                  'Participação em Labirinto',
                  ator.descricao,
                ),

                // DATA DE NASCIMENTO
                _informacao(
                  'Data de nascimento',
                  ator.dataNascimento,
                ),

                // LOCAL DE NASCIMENTO
                _informacao(
                  'Local de nascimento',
                  ator.localNascimento,
                ),

                // BIOGRAFIA
                _informacao(
                  'Sobre o participante',
                  ator.biografia,
                ),

                // CURIOSIDADE
                _informacao(
                  'Curiosidade',
                  ator.curiosidade,
                ),

                // SITE
                if (ator.possuiSiteOficial()) ...[
                  const SizedBox(height: 5),

                  ElevatedButton.icon(
                    onPressed: _abrirSite,
                    icon: const Icon(Icons.language),
                    label: const Text(
                      'Site oficial',
                    ),
                  ),
                ],

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}