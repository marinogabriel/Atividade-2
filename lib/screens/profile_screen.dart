import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        title: const Text(
          "Perfil de Usuário",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.01, left: size.width * 0.01),
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
                  "ulisses@ft.unicamp.br",
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
                  "Moedas: 5000",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: size.height * 0.023,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Pontos: 2840",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: size.height * 0.023,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Porcentagem de Vitória: 50.6%",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: size.height * 0.023,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Vitórias: 39",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: size.height * 0.023,
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
                child: Text(
                  "HISTORICO",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: size.height * 0.05),
                ),
              ),
              SizedBox(
                height: size.height * 0.8,
                width: size.width * 0.5,
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    ListTile(
                      trailing: Icon(Icons.verified),
                      title: Text(
                        "Vitória",
                        style: TextStyle(color: Colors.green),
                      ),
                      subtitle: Text('Mesa #42'),
                    ),
                    ListTile(
                      trailing: Icon(Icons.ac_unit),
                      title: Text(
                        "Derrota",
                        style: TextStyle(color: Colors.red),
                      ),
                      subtitle: Text('Mesa #1'),
                    ),
                    ListTile(
                      trailing: Icon(Icons.verified),
                      title: Text(
                        "Vitória",
                        style: TextStyle(color: Colors.green),
                      ),
                      subtitle: Text('Mesa #2'),
                    ),
                    ListTile(
                      trailing: Icon(Icons.verified),
                      title: Text(
                        "Vitória",
                        style: TextStyle(color: Colors.green),
                      ),
                      subtitle: Text('Mesa #42'),
                    ),
                    ListTile(
                      title: Text(
                        "Derrota",
                        style: TextStyle(color: Colors.red),
                      ),
                      trailing: Icon(Icons.ac_unit),
                      subtitle: Text('Mesa #4'),
                    ),
                    ListTile(
                      title: Text(
                        "Derrota",
                        style: TextStyle(color: Colors.red),
                      ),
                      trailing: Icon(Icons.ac_unit),
                      subtitle: Text('Mesa #42'),
                    ),
                    ListTile(
                      title: Text(
                        "Derrota",
                        style: TextStyle(color: Colors.red),
                      ),
                      trailing: Icon(Icons.ac_unit),
                      subtitle: Text('Mesa #3'),
                    ),
                    ListTile(
                      title: Text(
                        "Vitória",
                        style: TextStyle(color: Colors.green),
                      ),
                      trailing: Icon(Icons.verified),
                      subtitle: Text('Mesa #42'),
                    ),
                    ListTile(
                      trailing: Icon(Icons.ac_unit),
                      title: Text(
                        "Derrota",
                        style: TextStyle(color: Colors.red),
                      ),
                      subtitle: Text('Mesa #4'),
                    ),
                    ListTile(
                      trailing: Icon(Icons.ac_unit),
                      title: Text(
                        "Derrota",
                        style: TextStyle(color: Colors.red),
                      ),
                      subtitle: Text('Mesa #42'),
                    ),
                    ListTile(
                      title: Text(
                        "Vitória",
                        style: TextStyle(color: Colors.green),
                      ),
                      trailing: Icon(Icons.verified),
                      subtitle: Text('Mesa #33'),
                    ),
                    ListTile(
                      trailing: Icon(Icons.verified),
                      title: Text(
                        "Vitória",
                        style: TextStyle(color: Colors.green),
                      ),
                      subtitle: Text('Mesa #2'),
                    ),
                    ListTile(
                      trailing: Icon(Icons.verified),
                      title: Text(
                        "Vitória",
                        style: TextStyle(color: Colors.green),
                      ),
                      subtitle: Text('Mesa #17'),
                    ),
                    ListTile(
                      trailing: Icon(Icons.verified),
                      title: Text(
                        "Vitória",
                        style: TextStyle(color: Colors.green),
                      ),
                      subtitle: Text('Mesa #4'),
                    ),
                    ListTile(
                      trailing: Icon(Icons.ac_unit),
                      title: Text(
                        "Derrota",
                        style: TextStyle(color: Colors.red),
                      ),
                      subtitle: Text('Mesa #7'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
