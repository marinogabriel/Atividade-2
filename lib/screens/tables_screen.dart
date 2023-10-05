import 'dart:developer';
import 'package:flutter/material.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text("Mesa 1"),
          subtitle: const Text("Jogadores: 2/8...?"),
          leading: GestureDetector(
              onTap: () {
                log("Gesture Detector");
              },
              child: const Icon(Icons.remove_red_eye)),
          trailing: const Icon(Icons.table_bar),
          onTap: () {
            log("ListTile");
          },
        ),
        /* decoration fica pra depois...
        const Card(
          color: Colors.blue,
          elevation: 5,
          child: ListTile(
            title: Text("ListTile dentro do Card"),
            leading: Icon(Icons.cabin),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.yellow, Colors.red])),
          child: const ListTile(title: Text("ListTile dentro do Container")),
        ),*/
        ListTile(
          title: const Text("Mesa 2"),
          subtitle: const Text("Jogadores: 2/8...?"),
          leading: GestureDetector(
              onTap: () {
                log("Gesture Detector");
              },
              child: const Icon(Icons.remove_red_eye)),
          trailing: const Icon(Icons.table_bar),
          onTap: () {
            log("ListTile");
          },
        ),
        ListTile(
          title: const Text("Mesa 3"),
          subtitle: const Text("Jogadores: 2/8...?"),
          leading: GestureDetector(
              onTap: () {
                log("Gesture Detector");
              },
              child: const Icon(Icons.remove_red_eye)),
          trailing: const Icon(Icons.table_bar),
          onTap: () {
            log("ListTile");
          },
        ),
        ListTile(
          title: const Text("Mesa 4"),
          subtitle: const Text("Jogadores: 2/8...?"),
          leading: GestureDetector(
              onTap: () {
                log("Gesture Detector");
              },
              child: const Icon(Icons.remove_red_eye)),
          trailing: const Icon(Icons.table_bar),
          onTap: () {
            log("ListTile");
          },
        ),
        ListTile(
          title: const Text("Mesa 5"),
          subtitle: const Text("Jogadores: 2/8...?"),
          leading: GestureDetector(
              onTap: () {
                log("Gesture Detector");
              },
              child: const Icon(Icons.remove_red_eye)),
          trailing: const Icon(Icons.table_bar),
          onTap: () {
            log("ListTile");
          },
        ),
        ListTile(
          title: const Text("Mesa 6"),
          subtitle: const Text("Jogadores: 2/8...?"),
          leading: GestureDetector(
              onTap: () {
                log("Gesture Detector");
              },
              child: const Icon(Icons.remove_red_eye)),
          trailing: const Icon(Icons.table_bar),
          onTap: () {
            log("ListTile");
          },
        ),
        ListTile(
          title: const Text("Mesa 7"),
          subtitle: const Text("Jogadores: 2/8...?"),
          leading: GestureDetector(
              onTap: () {
                log("Gesture Detector");
              },
              child: const Icon(Icons.remove_red_eye)),
          trailing: const Icon(Icons.table_bar),
          onTap: () {
            log("ListTile");
          },
        ),
        ListTile(
          title: const Text("Mesa 8"),
          subtitle: const Text("Jogadores: 7/8...?"),
          leading: GestureDetector(
              onTap: () {
                log("Gesture Detector");
              },
              child: const Icon(Icons.remove_red_eye)),
          trailing: const Icon(Icons.table_bar),
          onTap: () {
            log("ListTile");
          },
        ),
      ],
    );
  }
}
