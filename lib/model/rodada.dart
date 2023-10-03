import 'package:flutter_application_1/model/jogador.dart';
import 'mesa.dart';

class Rodada {
  DateTime data;
  Mesa mesa;
  List<Jogador>? participantes;
  List<Jogador>? vencedores;

  Rodada({required this.data, required this.mesa});
}
