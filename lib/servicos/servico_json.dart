import 'dart:convert';
import 'package:flutter/services.dart';
import '../modelos/filme.dart';
import '../modelos/ator.dart';
import '../modelos/equipe.dart';

class ServicoJson {
  Future<List<Filme>> carregarFilmes() async {
    final arquivo = await rootBundle.loadString('assets/data/filme.json');
    final dados = jsonDecode(arquivo) as List<dynamic>;
    return dados.map((item) => Filme.fromJson(item)).toList();
  }

  Future<List<Ator>> carregarElenco() async {
    final arquivo = await rootBundle.loadString('assets/data/elenco.json');
    final dados = jsonDecode(arquivo) as List<dynamic>;
    return dados.map((item) => Ator.fromJson(item)).toList();
  }

  Future<List<Equipe>> carregarEquipe() async {
    final arquivo = await rootBundle.loadString('assets/data/equipe.json');
    final dados = jsonDecode(arquivo) as List<dynamic>;
    return dados.map((item) => Equipe.fromJson(item)).toList();
  }
}
