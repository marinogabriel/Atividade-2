import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  Future<void> updateUser(path) {
    String reference = '';
    return FirebaseFirestore.instance
        .collection('Users')
        .where(
          'email',
          isEqualTo: FirebaseAuth.instance.currentUser?.email,
        )
        .get()
        .then((QuerySnapshot querySnapshot) => users
            .doc(querySnapshot.docs.first.reference.id.toString())
            .update({'path': path})
            .then((value) => print("User Updated"))
            .catchError((error) => print("Failed to update user: $error")));
  }

  Future<void> _fetchAvatarImages() async {
    try {
      List<String>? result = await StorageServer.helper.fetchAvatarImages();

      if (result != null) {
        setState(() {
          imagePathList = result;
        });
      }
      print(result);
    } catch (e) {
      print("Error fetching avatar images: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchAvatarImages();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          infoData("Deseja mudar sua foto de avatar?"),
          infoData2("É só arrastar para o lado, escolher, e depois confirmar"),
          GestureDetector(
            onPanUpdate: (details) {
              // Swiping in right direction.
              if (details.delta.dx < 1) {
                setState(() {
                  if (currentIndex + 1 < imagePathList.length) currentIndex++;
                });
              }
              // Swiping in left direction.
              if (details.delta.dx > 1) {
                setState(() {
                  if (currentIndex > 0) currentIndex--;
                });
              }
            },
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  height: size.height * 0.1,
                  padding: EdgeInsets.all(size.height * 0.01),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                      ),
                    ],
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Colors.black,
                      Colors.red,
                    ]),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(imagePathList.isNotEmpty
                        ? imagePathList[currentIndex]
                        : 'https://t3.ftcdn.net/jpg/05/16/27/58/360_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg'), // use NetworkImage if it's a network image),
                  ),
                ),
              ),
            ),
          ),
          confirmButton(),
          logoutButton(),
        ],
      ),
    ));
  }

  Widget confirmButton() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 158, 13, 13),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.height * 0.015),
          child: Text(
            "Confirmar",
            style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: size.height * 0.025,
                fontStyle: FontStyle.normal),
          ),
        ),
        onPressed: () {
          updateUser(imagePathList[currentIndex]);
        },
      ),
    );
  }

  Widget infoData(String message) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.01),
      child: Text(
        message,
        textAlign: TextAlign.justify,
        style: GoogleFonts.poppins(
          color: const Color(0xff1D1617),
          fontSize: size.height * 0.03,
        ),
      ),
    );
  }

  Widget infoData2(String message) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.02),
      child: Text(
        message,
        textAlign: TextAlign.justify,
        style: GoogleFonts.poppins(
          color: const Color(0xff1D1617),
          fontSize: size.height * 0.018,
        ),
      ),
    );
  }

  Widget logoutButton() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.45),
      child: FractionallySizedBox(
        widthFactor: 0.7, // Ajuste o valor conforme necessário
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 0, 38),
          ),
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.010),
            child: Text(
              "Sair",
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: size.height * 0.015,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(
              Logout(),
            );
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
    );
  }
}
