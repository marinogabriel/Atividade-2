import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/config_screen.dart';
import 'package:flutter_application_1/screens/gameplay_screen.dart';
import 'package:flutter_application_1/screens/initial_screen.dart';
import 'package:flutter_application_1/screens/laucher_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/profile_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc.dart';
import 'bloc/manage_bloc.dart';
import 'bloc/monitor_bloc.dart';

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
              title: const Text("Login Screen"),
              backgroundColor: Colors.red,
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
                title: const Text("Profile Screen"),
                backgroundColor: Colors.red,
              ),
              body: BlocProvider.value(
                value: authBloc,
                child: BlocProvider.value(
                    value: monitorBloc,
                    child: BlocProvider.value(
                        value: manageBloc, child: const ProfileScreen())),
              ));
        });
      case "/launcher":
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
          return BlocProvider.value(
              value: monitorBloc,
              child: BlocProvider.value(
                  value: manageBloc, child: const GameplayScreen()));
        });
      case "/config":
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Profile Screen"),
                backgroundColor: Colors.red,
              ),
              body: BlocProvider.value(
                  value: monitorBloc,
                  child: BlocProvider.value(
                      value: manageBloc, child: const ConfigScreen())));
        });
      default:
        return MaterialPageRoute(builder: (_) {
          return const Text("algo deu errado");
        });
    }
  }
}
