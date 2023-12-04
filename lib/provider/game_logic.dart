import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/provider/normal_game.dart';
import 'dart:math';

class GameLogic {
  int dimension = NormalGame.helper.dropdownValue;
  List<String> cards = [
    'cartaFront1',
    'cartaFront2',
    'cartaFront3',
    'cartaFront4',
    'cartaFront5',
    'cartaFront6',
    'cartaFront7',
    'cartaFront8',
    'cartaFront9',
    'cartaFront10',
    'cartaFront11',
    'cartaFront12',
    'cartaFront13',
    'cartaFront14',
    'cartaFront15',
    'cartaFront16',
    'cartaFront17',
    'cartaFront18',
    'cartaFront19',
    'cartaFront20',
    'cartaFront21',
    'cartaFront22',
    'cartaFront23',
    'cartaFront24',
    'cartaFront25',
    'cartaFront26',
    'cartaFront27',
    'cartaFront28',
    'cartaFront29',
    'cartaFront30',
    'cartaFront31',
    'cartaFront32'
  ];

  Set<int> nums = {};

  List<String> drawer() {
    Set<int> drawnCards = {};

    while (nums.length != (dimension * dimension) / 2) {
      nums.add(Random().nextInt(32));
    }

    // Use os índices para acessar as cartas na lista 'cards'
    List<String> cartasDuplicadas = [
      for (var element in nums) cards[element],
      for (var element in nums) cards[element],
    ];

    // Embaralhar a lista de cartas duplicadas
    cartasDuplicadas.shuffle();

    return cartasDuplicadas;
  }
}
