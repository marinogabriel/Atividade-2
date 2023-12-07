import 'package:flutter/material.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ConfigScreenState();
  }
}

class ConfigScreenState extends State<ConfigScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: Center(
                child: Container(
                  height: size.height * 0.1,
                  padding: EdgeInsets.all(size.height * 0.01),
                ),
              ),
            ),
            Container(
              height: size.height * 0.4,
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                  ),
                ],
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Colors.black,
                  Colors.red,
                ]),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(360),
                  child: Image.asset('../assets/images/BlackJackApp.png')),
            ),
            confirmButton(),
          ],
        ),
      ],
    );
  }

  Widget confirmButton() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.18),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 158, 13, 13),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.height * 0.05),
          child: Text(
            "Confirmar",
            style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: size.height * 0.035,
                fontStyle: FontStyle.normal),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
