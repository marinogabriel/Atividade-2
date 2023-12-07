import '../model/users.dart';
import 'firebase_storage.dart';

import '../model/user.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {
  // Atributo que irá afunilar todas as consultas
  static FirestoreDatabase helper = FirestoreDatabase._createInstance();
  // Construtor privado
  FirestoreDatabase._createInstance();

  // username do usuário logado
  String? username;

  // Ponto de acesso com o servidor
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");

  Future<int> insertUser(Usuario user) async {
    DocumentReference ref = await userCollection.add({
      "name": user.name,
      "email": user.email,
      "username": user.username,
      "path": user.path
    });

    if (user.path != "") {
      await userCollection
          .doc(username)
          .collection("Users")
          .doc(ref.id)
          .update({
        "name": user.name,
        "email": user.email,
        "username": user.username,
        "path": user.path
      });
    }

    return 0;
  }

  Future<int> updateUser(userId, Usuario user) async {
    await userCollection.doc(username).collection("Users").doc(userId).update({
      "name": user.name,
      "email": user.email,
      "username": user.username,
      "path": user.path
    });
    return 0;
  }

  Future<int> deleteUser(userId) async {
    await userCollection.doc(username).collection("Users").doc(userId).delete();
    StorageServer.helper.deleteImage(username!, userId);
    return 0;
  }

  UserCollection _userListFromSnapshot(QuerySnapshot snapshot) {
    UserCollection userCollection = UserCollection();
    for (var doc in snapshot.docs) {
      Usuario user = Usuario.fromMap(doc.data());
      userCollection.insertUserOfId(doc.id, user);
    }
    return userCollection;
  }

  Future<UserCollection> getUserList() async {
    QuerySnapshot snapshot =
        await userCollection.doc(username).collection("Users").get();

    return _userListFromSnapshot(snapshot);
  }

  /*Stream get stream {
    return userCollection
        .doc(username)
        .collection("Users")
        .snapshots()
        .map(_userListFromSnapshot);
  }*/
}
