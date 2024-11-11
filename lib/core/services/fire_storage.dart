import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as p;

class FireStorage implements StorageService {
  final storageReference = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadImage(File file, String path) async {
    String fileName = p.basename(file.path);
    String fileExtension = p.extension(file.path);

    var fileReference =
        storageReference.child('$path/$fileName.$fileExtension');

    await fileReference.putFile(file);

    String fileUrl = await fileReference.getDownloadURL();

    return fileUrl;
  }
}
