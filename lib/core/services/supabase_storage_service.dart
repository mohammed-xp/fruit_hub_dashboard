import 'dart:io';

import 'package:fruit_hub_dashboard/consetans.dart';
import 'package:fruit_hub_dashboard/core/helper_function/get_path_file_function.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static Future<void> createBucket(String bucketName) async {
    var buckets = await _supabase.client.storage.listBuckets();

    bool isBucketExits = false;

    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExits = true;
        break;
      }
    }
    if (!isBucketExits) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static Future<void> initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseKeySecure,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String pathFile = getPathFile(file, path);

    await _supabase.client.storage.from(kBucketImages).upload(pathFile, file);

    String url = await _supabase.client.storage
        .from(kBucketImages)
        .getPublicUrl(pathFile);

    return url;
  }
}
