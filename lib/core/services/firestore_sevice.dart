import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/services/data_service.dart';

class FireStoreService implements DatabaseService {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? id,
  }) async {
    if (id != null) {
      await firestore.collection(path).doc(id).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String id,
  }) async {
    var data = await firestore.collection(path).doc(id).get();
    return data.data()!;
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String id,
  }) async {
    var data = await firestore.collection(path).doc(id).get();
    return data.exists;
  }
}
