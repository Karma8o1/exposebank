import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageController {
  static final FirebaseStorage storage = FirebaseStorage.instance;
  static Future<String> getDownloadUrl(String Url) async {
    String downloadUrl = await storage.ref(Url).getDownloadURL();
    return downloadUrl;
  }

  static Future<String?> uploadImage(
      {required String fileName,
      required String? filePath,
      required String bucketAddress}) async {
    File file = File(filePath ?? 'user');
    try {
      await storage.ref('$bucketAddress/$fileName').putFile(file).then((value) {
        getDownloadUrl('$bucketAddress/$fileName');
      });
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }
}
