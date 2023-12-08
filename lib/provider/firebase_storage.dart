// import 'dart:io';
// import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class StorageServer {
  // Atributo que irá afunilar todas as consultas
  static StorageServer helper = StorageServer._createInstance();
  // Construtor privado
  StorageServer._createInstance();

  Reference avatarImage = FirebaseStorage.instance.ref().child("avatars");

  Future<List<String>> fetchAvatarImages() async {
    try {
      final listResult = await avatarImage.listAll();
      List<String>? urlList = [];

      for (var item in listResult.items) {
        urlList.add(await item.getDownloadURL());
        //print(item.getDownloadURL().toString());
      }

      return urlList;
    } catch (e, stackTrace) {
      print("Error fetching avatar images: $e");
      print("Stack trace: $stackTrace");
      return [];
    }
  }

  /*UploadTask? insertImage(String fileName, Uint8List fileBytes) {
    try {
      var ref = avatarImage.child("$fileName.jpg");
      return ref.putData(fileBytes);
    } on FirebaseException {
      return null;
    }
  }*/

  deleteImage(String fileName, String noteId) {
    avatarImage.child(fileName).child("$noteId.jpg").delete();
  }
}
