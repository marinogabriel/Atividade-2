import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: const TabBarView(children: [
            SizedBox(
                child: FittedBox(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSydV4kK5JJeft5YJJ5wlEa_HJM2v0T7b7qfvg5D6UgfFiJsEdII3KQsdvhdB1elggReVs&usqp=CAU',
                        scale: 5),
                  ),
                  Text("Gabriel Marino"),
                ],
              ),
            )),
            SizedBox(
                child: FittedBox(
              child: Row(
                children: [
                  Text("Matheus"),
                ],
              ),
            )),
            SizedBox(
                child: FittedBox(
              child: Row(
                children: [
                  Text("Projeto"),
                ],
              ),
            )),
          ]),
          appBar: AppBar(
            title: const Text("Atividade 2"),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.face)),
                Tab(icon: Icon(Icons.face)),
                Tab(icon: Icon(Icons.gamepad_outlined)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
