import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/auth_bloc.dart';
import 'package:flutter_application_1/provider/firebase_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Users')
      .where(
        'email',
        isEqualTo: FirebaseAuth.instance.currentUser?.email,
      )
      .snapshots();

  final Stream<QuerySnapshot> _matchesStream = FirebaseFirestore.instance
      .collection('Matches')
      .where(
        'email',
        isEqualTo: FirebaseAuth.instance.currentUser?.email,
      )
      .orderBy('date', descending: true)
      .snapshots();

  @override
  void initState() {
    super.initState();
  }

  late final String documentId;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                print('Error in stream: ${snapshot}');
                return Text('Something went wrong');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading...");
              } else {
                var document = snapshot.data!.docs.first;
                var username = document['username'];
                var img = document['path'];

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: size.width * 0.035),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Center(
                                child: Container(
                                  margin:
                                      EdgeInsets.only(top: size.height * 0.01),
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
                                    child: Image.network((img != "")
                                        ? img
                                        : 'https://t3.ftcdn.net/jpg/05/16/27/58/360_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg'),
                                  ),
                                ),
                              ),
                            ),
                            profileData('Bem-vindo, $username'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Histórico de Rodadas",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 177, 48, 39),
                                  fontSize: size.height * 0.025),
                            ),
                            StreamBuilder<QuerySnapshot>(
                              stream: _matchesStream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Something went wrong');
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text("Loading");
                                }

                                return Container(
                                  constraints: BoxConstraints(
                                    maxHeight:
                                        MediaQuery.of(context).size.height,
                                  ),
                                  child: ListView(
                                    scrollDirection: Axis.vertical,
                                    children: snapshot.data!.docs
                                        .map((DocumentSnapshot document) {
                                      Map<String, dynamic> data = document
                                          .data()! as Map<String, dynamic>;
                                      if (data['win'] == 0) {
                                        print(data);
                                        return ListTile(
                                          isThreeLine: true,
                                          leading: const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                          title: Text(
                                              'Data: ${(data['date'] as Timestamp).toDate()}'),
                                          subtitle: Text(
                                              // ignore: prefer_interpolation_to_compose_strings
                                              '${'Tempo Usado: ${Duration(milliseconds: data['duration']).toString().substring(0, 10)}\nModo: ' + data['size']}x' +
                                                  data['size']),
                                          trailing: Text(
                                            'Derrota',
                                            style: GoogleFonts.permanentMarker(
                                              color: Colors.red,
                                              fontSize: size.height * 0.02,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return ListTile(
                                          isThreeLine: true,
                                          leading: const Icon(
                                            Icons.done,
                                            color: Colors.lightGreen,
                                          ),
                                          title: Text(
                                              'Data: ${(data['date'] as Timestamp).toDate()}'),
                                          subtitle: Text(
                                              // ignore: prefer_interpolation_to_compose_strings
                                              '${'Tempo Usado: ${Duration(milliseconds: data['duration']).toString().substring(0, 10)}\nModo: ' + data['size']}x' +
                                                  data['size']),
                                          trailing: Text(
                                            'Vitória',
                                            style: GoogleFonts.permanentMarker(
                                              color: Colors.lightGreen,
                                              fontSize: size.height * 0.02,
                                            ),
                                          ),
                                        );
                                      }
                                    }).toList(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }

  Widget profileData(String message) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.01),
      child: Text(
        message,
        textAlign: TextAlign.justify,
        style: GoogleFonts.poppins(
          color: const Color(0xff1D1617),
          fontSize: size.height * 0.02,
        ),
      ),
    );
  }
}
