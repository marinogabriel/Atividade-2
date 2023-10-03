import 'jogador.dart';

class Mesa {
  int numero;
  int moedas = 100;
  List<Jogador>? jogadoresAtivos;

  Mesa({required this.numero});
}
