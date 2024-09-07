import 'package:chatme/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // get auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  // get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }
  // sign in
  Future<UserCredential> signInUser(String email, password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    }
  }

  // sign up
  Future<UserCredential> signUpUser({required String email, required String password, required String name}) async {
    try {
      // create a new user
      UserCredential newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // save user records to firestore

      Users user = Users(
        uid: newUser.user!.uid,
        email: newUser.user!.email,
        name: name,
        createdAt: DateTime.now(),
      );

      _firestore.collection('Users').doc(newUser.user!.uid).set(user.toJson(), SetOptions(merge: true));

      return newUser;
    } on FirebaseAuthException catch (e) {
        throw e.code;
    }
  }

  // logout
  Future<void> signOutUser() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch  (e) {
      throw e.code;
    }
  }
}
