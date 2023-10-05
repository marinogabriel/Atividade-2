import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        title: const Text("TITULO"),
      ),
      body: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.01, left: size.width * 0.02),
                height: size.height * 0.25,
                padding: EdgeInsets.all(size.height * 0.01),
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
                  borderRadius: BorderRadius.circular(120),
                  child: Image.network(
                      'https://t3.ftcdn.net/jpg/05/16/27/58/360_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.02, top: size.height * 0.03),
                child: Text(
                  "AAAAAAAAAAAAAAAA",
                  style: TextStyle(
                    fontSize: size.height * 0.03,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Moedas: XXXX",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Pontos: XXXX",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.15),
                child: const Text(
                  "HISTORICO",
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
              ),
              /* QUEBRANDO O APP WHY ?!?!?
              ListView(
                children: const [ListTile()],
              ),*/
              const Text("AAAA"),
              const Text("AAAA"),
              const Text("AAAA"),
              const Text("AAAA"),
            ],
          ),
        ],
      ),
    );
  }
}
