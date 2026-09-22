import 'package:flutter/material.dart';
import '../modelos/equipe.dart';
import '../servicos/servico_json.dart';

class TelaEquipe extends StatelessWidget {
  TelaEquipe({super.key});
  final ServicoJson servico = ServicoJson();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipe técnica'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Equipe>>(
        future: servico.carregarEquipe(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text('Não foi possível carregar a equipe.'));
          }

          final lista = snapshot.data!;

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 390),
                child: Column(
                  children: [
                    const Icon(Icons.groups, size: 64),
                    const SizedBox(height: 12),
                    const Text(
                      'Principais profissionais do filme',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    ...lista.map(
                      (e) => Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              const Icon(Icons.person_outline, size: 38),
                              const SizedBox(height: 8),
                              Text(
                                e.nome,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(height: 4),
                              Text(e.funcao, textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
