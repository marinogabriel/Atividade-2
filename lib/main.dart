import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/initial_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyADbTdI3EjLFuhMwW_sHaZjYHNsrNe_TwI",
            authDomain: "blackjapp-bb005.firebaseapp.com",
            projectId: "blackjapp-bb005",
            storageBucket: "blackjapp-bb005.appspot.com",
            messagingSenderId: "514831039787",
            appId: "1:514831039787:web:cf4d921108d73015aad96e"));
  } else {
    await Firebase.initializeApp();
  }
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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc()),
        ],
        child: const InitialScreen(),
      ),
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Um objeto da classe PageController gerencia a troca de tela
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
          InitialScreen(),
        ],
      ),
    );
  }
}
*/