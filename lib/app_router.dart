import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/gameplay_screen.dart';
import 'package:flutter_application_1/screens/initial_screen.dart';
import 'package:flutter_application_1/screens/laucher_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/profile_screen.dart';
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
          return const InitialScreen();
        });

      case "/login":
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 255, 0, 0),
              title: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: BlocProvider.value(value: authBloc, child: const LoginForm()),
          );
        });

      case "/register":
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Register Screen"),
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
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                title: const Text(
                  "Página Principal",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: BlocProvider.value(
                value: authBloc,
                child: BlocProvider.value(
                    value: monitorBloc,
                    child: BlocProvider.value(
                        value: manageBloc, child: ProfileScreen())),
              ));
        });

      case "/launcher":
        //monitorBloc.add(UpdateStreamSubscription());
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Profile Screen"),
                backgroundColor: Colors.red,
              ),
              body: BlocProvider.value(
                  value: monitorBloc,
                  child: BlocProvider.value(
                      value: manageBloc, child: const LauncherScreen())));
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
                  value: monitorBloc,
                  child: BlocProvider.value(
                      value: manageBloc, child: const GameplayScreen())));
        });

      default:
        return MaterialPageRoute(builder: (_) {
          return const Text("ASDF");
        });
    }
  }
}
