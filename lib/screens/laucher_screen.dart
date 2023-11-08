import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/gameplay_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/complete_model.dart';

class LauncherScreen extends StatefulWidget {
  const LauncherScreen({super.key});

  @override
  State<LauncherScreen> createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  final CompleteModel completeModel = CompleteModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 0, 0),
          title: const Text(
            "Pré-Jogo",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Tem coragem de apostar suas moedas?',
              style: GoogleFonts.poppins(
                color: const Color(0xff1D1617),
                fontSize: size.height * 0.02,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.1),
              child: Text(
                "Escolha a quantidade de moedas que deseja usar na mesa:",
                style: TextStyle(
                  color: const Color(0xffADA4A5),
                  fontSize: size.height * 0.018,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.08),
              child: Text(
                '${sliderValue.toStringAsFixed(0)} moedas',
                style: TextStyle(
                  color: const Color(0xffADA4A5),
                  fontSize: size.height * 0.015,
                ),
              ),
            ),
            mySlider(),
            submitButton()
          ],
        ));
  }

  Widget mySlider() {
    return Slider(
      min: 0,
      max: 200,
      value: completeModel.sliderValue,
      onChanged: (double inValue) {
        sliderValue = inValue;
        setState(() => completeModel.sliderValue = inValue);
      },
    );
  }

  Widget submitButton() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 0, 38),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.02, bottom: size.height * 0.02),
            child: Text(
              "Iniciar Partida",
              style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: size.height * 0.02,
                  fontStyle: FontStyle.normal),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GameplayScreen()),
            );
          },
        ),
      ),
    );
  }
}
