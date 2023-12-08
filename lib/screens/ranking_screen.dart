import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return RankingScreenState();
  }
}

final Stream<QuerySnapshot> _matchesStream = FirebaseFirestore.instance
    .collection('Matches')
    .orderBy('duration', descending: false)
    .snapshots();

class RankingScreenState extends State<RankingScreen> {
  @override
  void initState() {
    super.initState();
  }

  late final String documentId;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          ranking2(context),
          ranking4(context),
          ranking6(context),
          ranking8(context),
        ],
      ),
    );
  }

  Widget ranking2(context) {
    Size size = MediaQuery.of(context).size;
    int cont2 = 0;
    return SingleChildScrollView(
      child: StreamBuilder<QuerySnapshot>(
        stream: _matchesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Error in stream: $snapshot');
            return const Text('Something went wrong');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Ranking 2x2",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 177, 48, 39),
                          fontSize: size.height * 0.025,
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height,
                        ),
                        child: ListView(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                            if (data['size'] == "2" &&
                                data['win'] == 1 &&
                                cont2 < 5) {
                              cont2++;
                              return ListTile(
                                isThreeLine: true,
                                leading: const Icon(
                                  Icons.star_border_sharp,
                                  color: Colors.lightGreen,
                                ),
                                title: Text(
                                  '$cont2° Lugar: ${(data['email'])}',
                                ),
                                subtitle: Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  '${'Tempo Usado: ${Duration(milliseconds: data['duration']).toString().substring(0, 10)}\nModo: ' + data['size']}x' +
                                      data['size'],
                                ),
                                trailing: Text(
                                  'Vitória',
                                  style: GoogleFonts.permanentMarker(
                                    color: Colors.lightGreen,
                                    fontSize: size.height * 0.02,
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox(
                                height: 0,
                                width: 0,
                              );
                            }
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget ranking4(context) {
    Size size = MediaQuery.of(context).size;
    int cont4 = 0;
    return SingleChildScrollView(
      child: StreamBuilder<QuerySnapshot>(
        stream: _matchesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Error in stream: $snapshot');
            return const Text('Something went wrong');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Ranking 4x4",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 177, 48, 39),
                          fontSize: size.height * 0.025,
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height,
                        ),
                        child: ListView(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                            if (data['size'] == "4" &&
                                data['win'] == 1 &&
                                cont4 < 5) {
                              cont4++;
                              return ListTile(
                                isThreeLine: true,
                                leading: const Icon(
                                  Icons.star_border_sharp,
                                  color: Colors.lightGreen,
                                ),
                                title: Text(
                                  '$cont4° Lugar: ${(data['email'])}',
                                ),
                                subtitle: Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  '${'Tempo Usado: ${Duration(milliseconds: data['duration']).toString().substring(0, 10)}\nModo: ' + data['size']}x' +
                                      data['size'],
                                ),
                                trailing: Text(
                                  'Vitória',
                                  style: GoogleFonts.permanentMarker(
                                    color: Colors.lightGreen,
                                    fontSize: size.height * 0.02,
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox(
                                height: 0,
                                width: 0,
                              );
                            }
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget ranking6(context) {
    Size size = MediaQuery.of(context).size;
    int cont6 = 0;
    return SingleChildScrollView(
      child: StreamBuilder<QuerySnapshot>(
        stream: _matchesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Error in stream: $snapshot');
            return const Text('Something went wrong');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Ranking 6x6",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 177, 48, 39),
                            fontSize: size.height * 0.025,
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height,
                          ),
                          child: ListView(
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              if (data['size'] == "6" &&
                                  data['win'] == 1 &&
                                  cont6 < 5) {
                                cont6++;
                                return ListTile(
                                  isThreeLine: true,
                                  leading: const Icon(
                                    Icons.star_border_sharp,
                                    color: Colors.lightGreen,
                                  ),
                                  title: Text(
                                    '$cont6° Lugar: ${(data['email'])}',
                                  ),
                                  subtitle: Text(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    '${'Tempo Usado: ${Duration(milliseconds: data['duration']).toString().substring(0, 10)}\nModo: ' + data['size']}x' +
                                        data['size'],
                                  ),
                                  trailing: Text(
                                    'Vitória',
                                    style: GoogleFonts.permanentMarker(
                                      color: Colors.lightGreen,
                                      fontSize: size.height * 0.02,
                                    ),
                                  ),
                                );
                              } else {
                                return const SizedBox(
                                  height: 0,
                                  width: 0,
                                );
                              }
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget ranking8(context) {
    Size size = MediaQuery.of(context).size;
    int cont8 = 0;
    return SingleChildScrollView(
      child: StreamBuilder<QuerySnapshot>(
        stream: _matchesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Error in stream: $snapshot');
            return const Text('Something went wrong');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Ranking 8x8",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 177, 48, 39),
                            fontSize: size.height * 0.025,
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height,
                          ),
                          child: ListView(
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              if (data['size'] == "8" &&
                                  data['win'] == 1 &&
                                  cont8 < 5) {
                                cont8++;
                                return ListTile(
                                  isThreeLine: true,
                                  leading: const Icon(
                                    Icons.star_border_sharp,
                                    color: Colors.lightGreen,
                                  ),
                                  title: Text(
                                    '$cont8° Lugar: ${(data['email'])}',
                                  ),
                                  subtitle: Text(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    '${'Tempo Usado: ${Duration(milliseconds: data['duration']).toString().substring(0, 10)}\nModo: ' + data['size']}x' +
                                        data['size'],
                                  ),
                                  trailing: Text(
                                    'Vitória',
                                    style: GoogleFonts.permanentMarker(
                                      color: Colors.lightGreen,
                                      fontSize: size.height * 0.02,
                                    ),
                                  ),
                                );
                              } else {
                                return const SizedBox(
                                  height: 0,
                                  width: 0,
                                );
                              }
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
