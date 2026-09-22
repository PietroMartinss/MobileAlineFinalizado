class Ator {
  final String nome;
  final String personagem;
  final String imagem;
  final String descricao;
  final String? dataNascimento;
  final String? localNascimento;
  final String? biografia;
  final String? curiosidade;
  final String? siteOficial;

  Ator({
    required this.nome,
    required this.personagem,
    required this.imagem,
    required this.descricao,
    this.dataNascimento,
    this.localNascimento,
    this.biografia,
    this.curiosidade,
    this.siteOficial,
  });

  factory Ator.fromJson(Map<String, dynamic> json) {
    return Ator(
      nome: json['nome'] ?? '',
      personagem: json['personagem'] ?? '',
      imagem: json['imagem'] ?? '',
      descricao: json['descricao'] ?? '',
      dataNascimento: json['dataNascimento'],
      localNascimento: json['localNascimento'],
      biografia: json['biografia'],
      curiosidade: json['curiosidade'],
      siteOficial: json['siteOficial'],
    );
  }

  bool possuiSiteOficial() {
    return siteOficial != null && siteOficial!.isNotEmpty;
  }
}