import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'firebase_storage.dart';

import '../model/user.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {
  // Atributo que irá afunilar todas as consultas
  static FirestoreDatabase helper = FirestoreDatabase._createInstance();
  // Construtor privado
  FirestoreDatabase._createInstance();

  // uid do usuário logado
  String? uid;

  // Ponto de acesso com o servidor
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  Future<User> getUser(userId) async {
    DocumentSnapshot doc =
        await userCollection.doc(uid).collection("usuarios").doc(userId).get();
    User user = User.fromMap(doc.data());
    return user;
  }

  Future<int> insertUser(User user) async {
    DocumentReference ref = await userCollection
        .doc(uid)
        .collection("Usuarios")
        .add({
      "title": user.title,
      "description": user.description,
      "path": user.path
    });

    if (user.path != "") {
      UploadTask? task =
          StorageServer.helper.insertImage(uid!, ref.id, user.path);
      if (task != null) {
        var snapshot = await task.whenComplete(() {});
        user.path = await snapshot.ref.getDownloadURL();

        await userCollection
            .doc(uid)
            .collection("Usuarios")
            .doc(ref.id)
            .update({
          "title": user.title,
          "description": user.description,
          "path": user.path
        });
      }
    }

    return 42;
  }

  Future<int> updateUser(userId, User user) async {
    if (user.path != "") {
      UploadTask? task =
          StorageServer.helper.insertImage(uid!, userId, user.path);
      if (task != null) {
        var snapshot = await task.whenComplete(() {});
        user.path = await snapshot.ref.getDownloadURL();
      }
    }

    await userCollection.doc(uid).collection("Usuarios").doc(userId).update({
      "title": user.title,
      "description": user.description,
      "path": user.path
    });
    return 42;
  }

  Future<int> deleteUser(userId) async {
    await userCollection.doc(uid).collection("Usuarios").doc(userId).delete();
    StorageServer.helper.deleteImage(uid!, userId);
    return 42;
  }

  UserCollection _userListFromSnapshot(QuerySnapshot snapshot) {
    UserCollection userCollection = UserCollection();
    for (var doc in snapshot.docs) {
      User user = User.fromMap(doc.data());
      userCollection.insertUserOfId(doc.id, user);
    }
    return userCollection;
  }

  Future<UserCollection> getUserList() async {
    QuerySnapshot snapshot =
        await userCollection.doc(uid).collection("usuarios").get();

    return _userListFromSnapshot(snapshot);
  }

  Stream get stream {
    return userCollection
        .doc(uid)
        .collection("Usuarios")
        .snapshots()
        .map(_userListFromSnapshot);
  }
}
