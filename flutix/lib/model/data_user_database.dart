import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> updateUserData(
    String namaLengkap,
    String email,
    String password,
    String profile,
    // String profileImageUrl,
  ) async {
    return await userCollection.doc(uid).set({
      
      'namaLengkap': namaLengkap,
      'email': email,
      'password': password,
      'profile': profile,
      // 'profileImageUrl': profileImageUrl,
    });
  }
}