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

final Stream<QuerySnapshot> _matchesStream2 = FirebaseFirestore.instance
    .collection('Matches')
    .where(
      'size',
      isEqualTo: 2,
    )
    .where(
      'win',
      isEqualTo: 1,
    )
    .orderBy('duration', descending: false)
    .snapshots();

final Stream<QuerySnapshot> _matchesStream4 = FirebaseFirestore.instance
    .collection('Matches')
    .where(
      'size',
      isEqualTo: 4,
    )
    .where(
      'win',
      isEqualTo: 1,
    )
    .orderBy('duration', descending: false)
    .snapshots();

final Stream<QuerySnapshot> _matchesStream6 = FirebaseFirestore.instance
    .collection('Matches')
    .where(
      'size',
      isEqualTo: 6,
    )
    .where(
      'win',
      isEqualTo: 1,
    )
    .orderBy('duration', descending: false)
    .snapshots();
final Stream<QuerySnapshot> _matchesStream8 = FirebaseFirestore.instance
    .collection('Matches')
    .where(
      'size',
      isEqualTo: 8,
    )
    .where(
      'win',
      isEqualTo: 1,
    )
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
          Padding(padding: EdgeInsets.only(top: size.height * 0.02)),
          ranking4(context),
          Padding(padding: EdgeInsets.only(top: size.height * 0.02)),
          ranking6(context),
          Padding(padding: EdgeInsets.only(top: size.height * 0.02)),
          ranking8(context),
          logoutButton()
        ],
      ),
    );
  }

  Widget logoutButton() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.020),
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
                  fontSize: size.height * 0.013,
                  fontStyle: FontStyle.normal),
            ),
          ),
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(
              Logout(),
            );
            Navigator.pop(context);
            Navigator.pop(context);
          }),
    );
  }
}

Widget ranking2(context) {
  Size size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: StreamBuilder<QuerySnapshot>(
      stream: _matchesStream2,
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
                            return ListTile(
                              isThreeLine: true,
                              leading: const Icon(
                                Icons.done,
                                color: Colors.lightGreen,
                              ),
                              title: Text(
                                'Data: ${(data['date'] as Timestamp).toDate()}',
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
  return SingleChildScrollView(
    child: StreamBuilder<QuerySnapshot>(
      stream: _matchesStream4,
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
                            return ListTile(
                              isThreeLine: true,
                              leading: const Icon(
                                Icons.done,
                                color: Colors.lightGreen,
                              ),
                              title: Text(
                                'Data: ${(data['date'] as Timestamp).toDate()}',
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
  return SingleChildScrollView(
    child: StreamBuilder<QuerySnapshot>(
      stream: _matchesStream6,
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
                            return ListTile(
                              isThreeLine: true,
                              leading: const Icon(
                                Icons.done,
                                color: Colors.lightGreen,
                              ),
                              title: Text(
                                'Data: ${(data['date'] as Timestamp).toDate()}',
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
  return SingleChildScrollView(
    child: StreamBuilder<QuerySnapshot>(
      stream: _matchesStream8,
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
                            return ListTile(
                              isThreeLine: true,
                              leading: const Icon(
                                Icons.done,
                                color: Colors.lightGreen,
                              ),
                              title: Text(
                                'Data: ${(data['date'] as Timestamp).toDate()}',
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
                ),
              ],
            ),
          );
        }
      },
    ),
  );
}

Widget logoutButton(context) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.only(top: size.height * 0.020),
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
                fontSize: size.height * 0.013,
                fontStyle: FontStyle.normal),
          ),
        ),
        onPressed: () {
          BlocProvider.of<AuthBloc>(context).add(
            Logout(),
          );
          Navigator.pop(context);
          Navigator.pop(context);
        }),
  );
}
