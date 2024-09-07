import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {
  // firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // get all users


  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((user) {
        return user.data();
      }).toList();
    });
  }
}