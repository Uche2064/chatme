import 'package:chatme/models/message.dart';
import 'package:chatme/models/users.dart';
import 'package:chatme/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {
  // firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _authService = AuthService();
  // get all users

  Stream<List<Users>> getUserStream() {
    return _firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((user) {
        return Users.fromJson(user.data());
      }).toList();
    });
  }

  // send message
  Future<void> sendMessage({required String receiverId, message}) async {
    // get current user info
    String currentUserId = _authService.getCurrentUser()!.uid;
    String currentUserEmail = _authService.getCurrentUser()!.email!;

    // create the message
    Message newMessage = Message(
      message: message,
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      sentAt: DateTime.now(),
    );

    // create a chatroom id
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatroomId = ids.join('_');

    // save the message to firestore
    _firestore
        .collection('ChatRoom')
        .doc(chatroomId)
        .collection('messages')
        .add(newMessage.toJson());
  }

  // get message

  Stream<QuerySnapshot> getMessages(String currentUserId, otherUserId) {
    // construct a chat room id for the two users
    List<String> ids = [currentUserId, otherUserId];
    ids.sort();
    String chatroomId = ids.join('_');

    return _firestore
        .collection('ChatRoom')
        .doc(chatroomId)
        .collection('messages')
        .orderBy('sentAt', descending: false)
        .snapshots();
  }
}
