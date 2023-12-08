import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/config_screen.dart';
import 'package:flutter_application_1/screens/profile_screen.dart';
import 'package:flutter_application_1/screens/ranking_screen.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.star)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 255, 17, 0),
          title: const Text(
            "BigBrain",
            style: TextStyle(
              color: Colors.white, // Defina a cor do texto como branco
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            ProfileScreen(),
            RankingScreen(),
            ConfigScreen(),
          ],
        ),
      ),
    );
  }
}
