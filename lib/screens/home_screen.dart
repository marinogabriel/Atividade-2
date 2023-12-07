import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/config_screen.dart';
import 'package:flutter_application_1/screens/profile_screen.dart';

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
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          title: const Text('BigBrain'),
        ),
        body: const TabBarView(
          children: [
            ProfileScreen(),
            Icon(Icons.directions_transit),
            ConfigScreen(),
          ],
        ),
      ),
    );
  }
}
