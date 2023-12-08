import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/config_screen.dart';
import 'package:flutter_application_1/screens/gameplay_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/initial_screen.dart';
import 'package:flutter_application_1/screens/laucher_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc.dart';
import 'bloc/manage_bloc.dart';
import 'bloc/monitor_user_bloc.dart';

class AppRouter {
  AuthBloc authBloc = AuthBloc();
  ManageBloc manageBloc = ManageBloc();
  MonitorBloc monitorBloc = MonitorBloc();

  Route onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case "/":
        return MaterialPageRoute(builder: (_) {
          return BlocProvider.value(
              value: authBloc, child: const InitialScreen());
        });

      case "/login":
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 255, 0, 0),
              title: const Text(
                "Entrar",
                style: TextStyle(
                  color: Colors.white, // Defina a cor do texto como branco
                ),
              ),
            ),
            body: BlocProvider.value(value: authBloc, child: const LoginForm()),
          );
        });

      case "/register":
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Registrar",
                style: TextStyle(
                  color: Colors.white, // Defina a cor do texto como branco
                ),
              ),
              backgroundColor: Colors.red,
            ),
            body: BlocProvider.value(
              value: manageBloc,
              child: BlocProvider.value(
                  value: authBloc, child: const RegisterForm()),
            ),
          );
        });

      case "/profile":
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  Navigator.pushNamed(_, "/launcher");
                },
                child: const Text(
                  "Jogar",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 15,
                      fontStyle: FontStyle.normal),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              body: BlocProvider.value(
                value: authBloc,
                child: BlocProvider.value(
                    value: monitorBloc,
                    child: BlocProvider.value(
                        value: manageBloc, child: const HomeScreen())),
              ));
        });

      case "/launcher":
        //monitorBloc.add(UpdateStreamSubscription());
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Escolhendo a dimensão",
                  style: TextStyle(
                    color: Colors.white, // Defina a cor do texto como branco
                  ),
                ),
                backgroundColor: Colors.red,
              ),
              body: BlocProvider.value(
                value: authBloc,
                child: BlocProvider.value(
                  value: monitorBloc,
                  child: BlocProvider.value(
                      value: manageBloc, child: const LauncherScreen()),
                ),
              ));
        });

      case "/game":
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                title: const Text(
                  "Jogo",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              body: BlocProvider.value(
                value: authBloc,
                child: BlocProvider.value(
                    value: monitorBloc,
                    child: BlocProvider.value(
                        value: manageBloc, child: const GameplayScreen())),
              ));
        });

      case "/config":
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                title: const Text(
                  "Configuração",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              body: BlocProvider.value(
                value: authBloc,
                child: BlocProvider.value(
                    value: monitorBloc,
                    child: BlocProvider.value(
                        value: manageBloc, child: const ConfigScreen())),
              ));
        });

      default:
        return MaterialPageRoute(builder: (_) {
          return const Text("algo deu errado");
        });
    }
  }
}
