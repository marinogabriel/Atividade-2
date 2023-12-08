import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/manage_bloc.dart';
import '../model/user.dart';
import '../provider/firebase_storage.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ConfigScreenState();
  }
}

Usuario user = Usuario();

class ConfigScreenState extends State<ConfigScreen> {
  List<String> imagePathList = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchAvatarImages();
  }

  Future<void> _fetchAvatarImages() async {
    try {
      // Call the fetchAvatarImages function and await the result
      List<String>? result = await StorageServer.helper.fetchAvatarImages();

      // Update the imagePathList if the result is not null
      if (result != null) {
        setState(() {
          imagePathList = result;
        });
      }
      print(result);
    } catch (e) {
      // Handle any errors
      print("Error fetching avatar images: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          // Swiping in right direction.
          if (details.delta.dx < 0) {
            setState(() {
              if (currentIndex + 1 < imagePathList.length) currentIndex++;
            });
          }

          // Swiping in left direction.
          if (details.delta.dx > 0) {
            setState(() {
              if (currentIndex > 0) currentIndex--;
            });
          }
        },
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: NetworkImage(imagePathList.isNotEmpty
                      ? imagePathList[currentIndex]
                      : 'https://t3.ftcdn.net/jpg/05/16/27/58/360_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg'), // use NetworkImage if it's a network image
                  fit: BoxFit.scaleDown,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text("ID: $currentIndex"),
                    confirmButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget confirmButton() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.6),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 158, 13, 13),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.height * 0.05),
          child: Text(
            "Confirmar",
            style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: size.height * 0.035,
                fontStyle: FontStyle.normal),
          ),
        ),
        onPressed: () {
          user.path = imagePathList[currentIndex];
          BlocProvider.of<ManageBloc>(context).add(SubmitEvent(user: user));
        },
      ),
    );
  }
}
