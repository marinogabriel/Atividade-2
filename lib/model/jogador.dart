import 'package:flutter_application_1/model/rodada.dart';

class Jogador {
  int id;
  String? nome;
  String? email;
  String? senha;
  int moedas = 100;
  int pontuacao = 0;
  int rodadasGanhas = 0;
  List<Rodada>? historico;

  //Jogador({required this.nome, required this.email, required this.senha});
  Jogador({required this.id});
}
