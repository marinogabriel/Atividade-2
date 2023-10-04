import 'jogador.dart';

class Mesa {
  int numero;
  int pontuacaoMesa = 0;
  List<Jogador>? jogadoresAtivos;
  Jogador? jogadorAtual;

  Mesa({required this.numero});
}
