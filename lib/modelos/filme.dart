class Filme {
  final String titulo, tituloOriginal, diretor, genero, sinopse, roteiro, diretorFotografia, editor, diretoraCasting, designerProducao, compositor, imagem, siteOficial;
  final int ano, duracao;
  final List<String> historia, produtores, produtoresExecutivos, figurinistas, maquiagem, curiosidades;

  Filme({required this.titulo,required this.tituloOriginal,required this.ano,required this.duracao,required this.diretor,required this.genero,required this.sinopse,required this.roteiro,required this.historia,required this.produtores,required this.produtoresExecutivos,required this.diretorFotografia,required this.editor,required this.diretoraCasting,required this.designerProducao,required this.figurinistas,required this.compositor,required this.maquiagem,required this.curiosidades,required this.imagem,required this.siteOficial});

  factory Filme.fromJson(Map<String,dynamic> j)=>Filme(
    titulo:j['titulo'],tituloOriginal:j['tituloOriginal'],ano:j['ano'],duracao:j['duracao'],diretor:j['diretor'],genero:j['genero'],sinopse:j['sinopse'],roteiro:j['roteiro'],
    historia:List<String>.from(j['historia']),produtores:List<String>.from(j['produtores']),produtoresExecutivos:List<String>.from(j['produtoresExecutivos']),
    diretorFotografia:j['diretorFotografia'],editor:j['editor'],diretoraCasting:j['diretoraCasting'],designerProducao:j['designerProducao'],figurinistas:List<String>.from(j['figurinistas']),
    compositor:j['compositor'],maquiagem:List<String>.from(j['maquiagem']),curiosidades:List<String>.from(j['curiosidades']),imagem:j['imagem'],siteOficial:j['siteOficial']);
}
