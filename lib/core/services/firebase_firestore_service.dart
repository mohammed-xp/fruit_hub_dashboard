import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub_dashboard/core/services/database_service.dart';

class FirebaseFirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? id,
  }) async {
    if (id != null) {
      await FirebaseFirestore.instance.collection(path).doc(id).set(data);
    } else {
      await FirebaseFirestore.instance.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String id}) async {
    var result =
        await FirebaseFirestore.instance.collection(path).doc(id).get();

    return result.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String id}) async {
    var result =
        await FirebaseFirestore.instance.collection(path).doc(id).get();
    return result.exists;
  }
}
