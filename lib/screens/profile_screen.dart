import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/auth_bloc.dart';
import 'package:flutter_application_1/provider/firebase_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading...");
            } else {
              var document = snapshot.data!.docs.first;
              var username = document['username'];

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
                                  child: Image.network(
                                      'https://t3.ftcdn.net/jpg/05/16/27/58/360_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg'),
                                ),
                              ),
                            ),
                          ),
                          profileData(username),
                          Container(
                            margin: EdgeInsets.only(top: size.height * 0.25),
                            height: size.height * 0.15,
                            padding: const EdgeInsets.all(8.0),
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
                                borderRadius: BorderRadius.circular(120),
                                child: Image.asset(
                                    '../assets/images/BlackJackApp.png')),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: size.width * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Histórico de Rodadas",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 177, 48, 39),
                                fontSize: size.height * 0.025),
                          ),
                          SizedBox(
                            height: size.height * 0.8,
                            width: size.width * 0.5,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                ListTile(
                                  trailing: const Icon(Icons.verified),
                                  title: Text(
                                    "Vitória",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: size.height * 0.018,
                                    ),
                                  ),
                                  subtitle: Text('Mesa #42',
                                      style: TextStyle(
                                        fontSize: size.height * 0.013,
                                      )),
                                ),
                                ListTile(
                                  trailing: const Icon(Icons.ac_unit),
                                  title: Text(
                                    "Derrota",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: size.height * 0.018,
                                    ),
                                  ),
                                  subtitle: Text('Mesa #1',
                                      style: TextStyle(
                                        fontSize: size.height * 0.013,
                                      )),
                                ),
                                ListTile(
                                  trailing: const Icon(Icons.verified),
                                  title: Text(
                                    "Vitória",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: size.height * 0.018,
                                    ),
                                  ),
                                  subtitle: Text('Mesa #2',
                                      style: TextStyle(
                                        fontSize: size.height * 0.013,
                                      )),
                                ),
                                ListTile(
                                  title: Text(
                                    "Vitória",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: size.height * 0.018,
                                    ),
                                  ),
                                  trailing: const Icon(Icons.verified),
                                  subtitle: Text('Mesa #42',
                                      style: TextStyle(
                                        fontSize: size.height * 0.013,
                                      )),
                                ),
                                ListTile(
                                  trailing: const Icon(Icons.ac_unit),
                                  title: Text(
                                    "Derrota",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: size.height * 0.018,
                                    ),
                                  ),
                                  subtitle: Text('Mesa #4',
                                      style: TextStyle(
                                        fontSize: size.height * 0.013,
                                      )),
                                ),
                                ListTile(
                                  trailing: const Icon(Icons.ac_unit),
                                  title: Text(
                                    "Derrota",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: size.height * 0.018,
                                    ),
                                  ),
                                  subtitle: Text('Mesa #42',
                                      style: TextStyle(
                                        fontSize: size.height * 0.013,
                                      )),
                                ),
                                ListTile(
                                  trailing: const Icon(Icons.verified),
                                  title: Text(
                                    "Vitória",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: size.height * 0.018,
                                    ),
                                  ),
                                  subtitle: Text('Mesa #4',
                                      style: TextStyle(
                                        fontSize: size.height * 0.013,
                                      )),
                                ),
                                ListTile(
                                  trailing: const Icon(Icons.ac_unit),
                                  title: Text(
                                    "Derrota",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: size.height * 0.018,
                                    ),
                                  ),
                                  subtitle: Text('Mesa #7',
                                      style: TextStyle(
                                        fontSize: size.height * 0.013,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          logoutButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
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

  Widget profileData(String message) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.01),
      child: Text(
        message,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: size.height * 0.013,
        ),
      ),
    );
  }
}


//ListView dinâmica
/*ListView getUserListView(UserCollection userCollection) {
  return ListView.builder(
    itemCount: userCollection.length(),
    itemBuilder: (context, position) => ListTile(
      onTap: () {
        //print(userCollection.getIdAtIndex(position));
        BlocProvider.of<ManageBloc>(context).add(UpdateRequest(
          userId: userCollection.getIdAtIndex(position),
          previousUser: userCollection.getUserAtIndex(position),
        ));
      },
      leading: SizedBox(
        height: 40,
        width: 40,
        child: Image.network(userCollection.getUserAtIndex(position).username),
      ),
      trailing: GestureDetector(
          onTap: () {
            BlocProvider.of<ManageBloc>(context).add(
                DeleteEvent(userId: userCollection.getIdAtIndex(position)));
          },
          child: const Icon(Icons.delete)),
      title: Text(userCollection.getUserAtIndex(position).name),
      subtitle: Text(userCollection.getUserAtIndex(position).email),
    ),
  );
}
*/