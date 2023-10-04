import 'package:flutter/material.dart';

loginScreen() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: SizedBox(
          width: double.infinity,
          height: 200.0,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.network(
                'https://images.unsplash.com/photo-1655159428752-c700435e9983?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGJsYWNrJTIwamFja3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
          ),
        ),
      ),
      /*ConstrainedBox(
        constraints: const BoxConstraints(
            minHeight: 200, minWidth: 200, maxHeight: 300, maxWidth: 1900),
        child: FittedBox(
          //child: Text("blackjAPP"),
          child: TextFormField(
            initialValue: "AAAAA",
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 0, 0),
            ),
          ),
        ),
      ),*/
      ConstrainedBox(
        constraints: const BoxConstraints(
            minHeight: 200, minWidth: 150, maxHeight: 300, maxWidth: 1900),
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
                onPressed: () {
                  // Faça algo com os dados
                },
                child: const Text("Jogar!")),
          ),
        ),
      )
      /*const Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            "O aplicativo vai se basear no jogo blackjack/21, onde os jogadores poderão criar suas contas e jogarem rodadas online simultâneas contra outros jogadores. O dealer será uma máquina virtual simples, também conhecida como computador. Além disso, também existirá um histórico de partidas, sistema de pontos e um ranking dos melhores jogadores.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),*/
    ],
  );
}
