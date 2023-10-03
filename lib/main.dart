import 'dart:ui';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BlackjAPP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        title: Text(widget.title),
      ),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            }),
            child: TabBarView(children: [
              loginScreen(),
              tela1(),
              tela2(),
            ]),
          ),
          appBar: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.gamepad_outlined),
                text: "Main",
              ),
              Tab(
                icon: Icon(Icons.face),
                text: "Matheus",
              ),
              Tab(
                icon: Icon(Icons.gamepad_outlined),
                text: "Projeto",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tela1() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          height: 240,
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
              borderRadius: BorderRadius.circular(120),
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw6bPf8LRCQVSu31vZzm93dD55792NLtbdXQ&usqp=CAU')),
        ),
        const Text(
          "Gabriel Marino",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            color: Colors.red,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            "Estudante de Análise e Desenvolvimento de Sistemas na UNICAMP, atualmente no 6° semestre. Desde criança sempre foi fascinado com computadores, o que tornou a escolha de carreira bastante fácil. Entusiasta de voleibol, desenhos japoneses e jogos eletrônicos.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget tela2() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          height: 173,
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
              Colors.red,
              Colors.black,
            ]),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: Image.network(
                  'https://pps.whatsapp.net/v/t61.24694-24/118198409_463147921308473_7049084923594510693_n.jpg?ccb=11-4&oh=01_AdRHBeIC5bX0WlCVzAJ6Q4JsvR39kdirBieXTlN9n3EkXg&oe=6506134D&_nc_sid=000000&_nc_cat=102')),
        ),
        const Text(
          "Matheus Roberto Mariano",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            color: Colors.red,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            "Desenvolvedor de Software orientado a resultados com ampla experiência em análise de web analytics e uma sólida base em JavaScript, SQL e análise de dados. Dedicado a otimizar as experiências do usuário e impulsionar o crescimento dos negócios por meio de soluções inovadoras. Aplicando mais de 4 anos de experiência em programação para criar soluções de software impactantes.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
