import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/tables_screen.dart';
import 'package:flutter_application_1/screens/profile_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'screens/main_screen.dart';
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
  // Um objeto da classe PageController gerencia a detecção do gesto de swype.
  final PageController _controller = PageController(
    initialPage: 0, // Configura a tela inicial
  );

  int localPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          localPage = index;
        },
        // O parâmetro "children" recebe todas as páginas
        children: const [
          ProfileScreen(),
          RegisterForm(),
          LoginForm(),
        ],
      ),
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
                  'https://images.unsplash.com/photo-1655159428752-c700435e9983?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGJsYWNrJTIwamFja3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80')),
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
