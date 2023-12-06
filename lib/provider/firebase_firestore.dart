import 'package:firebase_storage/firebase_storage.dart';
import '../model/users.dart';
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
      FirebaseFirestore.instance.collection("Users");

  Future<User> getUser(userId) async {
    DocumentSnapshot doc =
        await userCollection.doc(uid).collection("Users").doc(userId).get();
    User user = User.fromMap(doc.data());
    return user;
  }

  Future<int> insertUser(User user) async {
    DocumentReference ref = await userCollection.add(
        {"name": user.name, "email": user.email, "username": user.username});

    /*if (user.username != "") {
      UploadTask? task =
          StorageServer.helper.insertImage(uid!, ref.id, user.username);
      if (task != null) {
        var snapshot = await task.whenComplete(() {});
        user.username = await snapshot.ref.getDownloadURL();

        await userCollection.doc(uid).collection("Users").doc(ref.id).update({
          "name": user.name,
          "email": user.email,
          "username": user.username
        });
      }
    }
*/
    return 0;
  }

  Future<int> updateUser(userId, User user) async {
    if (user.username != "") {
      UploadTask? task =
          StorageServer.helper.insertImage(uid!, userId, user.username);
      if (task != null) {
        var snapshot = await task.whenComplete(() {});
        user.username = await snapshot.ref.getDownloadURL();
      }
    }

    await userCollection.doc(uid).collection("Users").doc(userId).update(
        {"name": user.name, "email": user.email, "username": user.username});
    return 0;
  }

  Future<int> deleteUser(userId) async {
    await userCollection.doc(uid).collection("Users").doc(userId).delete();
    StorageServer.helper.deleteImage(uid!, userId);
    return 0;
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
        await userCollection.doc(uid).collection("Users").get();

    return _userListFromSnapshot(snapshot);
  }

  Stream get stream {
    return userCollection
        .doc(uid)
        .collection("Users")
        .snapshots()
        .map(_userListFromSnapshot);
  }
}
