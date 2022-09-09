import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageController {
  static final FirebaseStorage storage = FirebaseStorage.instance;

  static Future<String?> uploadImage(
      {required String fileName,
      required String? filePath,
      required String bucketAddress}) async {
    UploadTask? uploadTask;
    File file = File(filePath ?? 'user');
    try {
      final ref = await storage.ref('$bucketAddress/$fileName');
      uploadTask = ref.putFile(file);
      // .then((value) {
      //   // getDownloadUrl('$bucketAddress/$fileName');
      // });
      final snapshot = await uploadTask.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      return urlDownload;
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }
}
