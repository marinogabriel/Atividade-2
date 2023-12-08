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

int iterator = 0;
Stream<QuerySnapshot> _matchesStream = FirebaseFirestore.instance
    .collection('Matches')
    .where('size', isEqualTo: "2")
    .where('win', isEqualTo: 1)
    .orderBy('duration', descending: false)
    .limit(5)
    .snapshots();

Stream<QuerySnapshot> _matchesStreamFour = FirebaseFirestore.instance
    .collection('Matches')
    .where('size', isEqualTo: "4")
    .where('win', isEqualTo: 1)
    .orderBy('duration', descending: false)
    .limit(5)
    .snapshots();

Stream<QuerySnapshot> _matchesStreamSix = FirebaseFirestore.instance
    .collection('Matches')
    .where('size', isEqualTo: "6")
    .where('win', isEqualTo: 1)
    .orderBy('duration', descending: false)
    .limit(5)
    .snapshots();

Stream<QuerySnapshot> _matchesStreamEight = FirebaseFirestore.instance
    .collection('Matches')
    .where('size', isEqualTo: "8")
    .where('win', isEqualTo: 1)
    .orderBy('duration', descending: false)
    .limit(5)
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
      child: StreamBuilder<QuerySnapshot>(
        stream: _matchesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Error in stream: $snapshot');
            return const Text('Something went wrong');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          } else {
            iterator = 0;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
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
                      maxHeight: MediaQuery.of(context).size.height * 0.5,
                    ),
                    child: ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;

                        iterator += 1;
                        return ListTile(
                          isThreeLine: true,
                          leading: const Icon(
                            Icons.star_border_sharp,
                            color: Colors.lightGreen,
                          ),
                          title: Text(
                            '$iterator° Lugar: ${(data['email'])}',
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
                      }).toList(),
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: _matchesStreamFour,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        print('Error in stream: $snapshot');
                        return const Text('Something went wrong');
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Text("Loading...");
                      } else {
                        iterator = 0;
                        return Center(
                          child: Column(
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
                                    Map<String, dynamic> data = document.data()!
                                        as Map<String, dynamic>;

                                    iterator += 1;
                                    return ListTile(
                                      isThreeLine: true,
                                      leading: const Icon(
                                        Icons.star_border_sharp,
                                        color: Colors.lightGreen,
                                      ),
                                      title: Text(
                                        '$iterator° Lugar: ${(data['email'])}',
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
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: _matchesStreamSix,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        print('Error in stream: $snapshot');
                        return const Text('Something went wrong');
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Text("Loading...");
                      } else {
                        iterator = 0;
                        return Center(
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
                                    Map<String, dynamic> data = document.data()!
                                        as Map<String, dynamic>;

                                    iterator += 1;
                                    return ListTile(
                                      isThreeLine: true,
                                      leading: const Icon(
                                        Icons.star_border_sharp,
                                        color: Colors.lightGreen,
                                      ),
                                      title: Text(
                                        '$iterator° Lugar: ${(data['email'])}',
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
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: _matchesStreamEight,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        print('Error in stream: $snapshot');
                        return const Text('Something went wrong');
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Text("Loading...");
                      } else {
                        iterator = 0;
                        return Center(
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
                                    Map<String, dynamic> data = document.data()!
                                        as Map<String, dynamic>;

                                    iterator += 1;
                                    return ListTile(
                                      isThreeLine: true,
                                      leading: const Icon(
                                        Icons.star_border_sharp,
                                        color: Colors.lightGreen,
                                      ),
                                      title: Text(
                                        '$iterator° Lugar: ${(data['email'])}',
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
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
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
