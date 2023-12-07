import 'package:firebase_storage/firebase_storage.dart';

class StorageServer {
  // Atributo que irá afunilar todas as consultas
  static StorageServer helper = StorageServer._createInstance();
  // Construtor privado
  StorageServer._createInstance();

  Reference avatarImage = FirebaseStorage.instance.ref().child("avatars");

  Future<String>? getImage(String name) {
    try {
      var ref = avatarImage.child(name);
      return ref.getDownloadURL();
    } on FirebaseException {
      return null;
    }
  }

  deleteImage(String uid, String noteId) {
    avatarImage.child(uid).child(noteId + ".jpg").delete();
  }
}
