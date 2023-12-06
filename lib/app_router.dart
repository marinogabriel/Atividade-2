import 'package:flutter/material.dart';
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
                title: const Text("Counter Screen"),
                backgroundColor: Colors.blue,
              ),
              body: BlocProvider.value(
                value: authBloc,
                child: BlocProvider.value(
                  value: manageBloc,
                  child: BlocProvider.value(
                      value: monitorBloc, child: const LoginForm()),
                ),
              ));
        });
      case "/register":
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Register Screen"),
                backgroundColor: Colors.blue,
              ),
              body: const RegisterForm());
        });
      case "/profile":
        monitorBloc.add(UpdateStreamSubscription());
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Profile Screen"),
                backgroundColor: Colors.blue,
              ),
              body: BlocProvider.value(
                  value: monitorBloc,
                  child: BlocProvider.value(
                      value: manageBloc, child: const ProfileScreen())));
        });
      case "/launcher":
        monitorBloc.add(UpdateStreamSubscription());
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Profile Screen"),
                backgroundColor: Colors.blue,
              ),
              body: BlocProvider.value(
                  value: monitorBloc,
                  child: BlocProvider.value(
                      value: manageBloc, child: const LauncherScreen())));
        });
      case "/game":
        monitorBloc.add(UpdateStreamSubscription());
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Profile Screen"),
                backgroundColor: Colors.blue,
              ),
              body: BlocProvider.value(
                  value: monitorBloc,
                  child: BlocProvider.value(
                      value: manageBloc, child: const ProfileScreen())));
        });
      default:
        return MaterialPageRoute(builder: (_) {
          return const Text("ASDF");
        });
    }
  }
}
