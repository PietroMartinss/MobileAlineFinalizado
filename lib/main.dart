import 'package:flutter/material.dart';
import 'telas/tela_inicial.dart';

void main()=>runApp(const AplicativoLabirinto());

class AplicativoLabirinto extends StatelessWidget {
  const AplicativoLabirinto({super.key});
  @override Widget build(BuildContext context)=>MaterialApp(
    debugShowCheckedModeBanner:false,
    title:'Labirinto - A Magia do Tempo',
    theme:ThemeData(colorScheme:ColorScheme.fromSeed(seedColor:Colors.deepPurple),useMaterial3:true),
    home:TelaInicial(),
  );
}
