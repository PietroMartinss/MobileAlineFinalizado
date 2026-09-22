class Equipe {
  final String nome, funcao;
  Equipe({required this.nome,required this.funcao});
  factory Equipe.fromJson(Map<String,dynamic> j)=>Equipe(nome:j['nome'],funcao:j['funcao']);
}
