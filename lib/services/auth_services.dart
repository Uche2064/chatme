import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // get auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in
  Future<UserCredential> signInUser(String email, password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      
      throw Exception(e.toString());
    }
  }

  // sign up
  Future<UserCredential> signUpUser(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw e.code;
      }
      throw e.toString();
    }
  }

  // logout
  Future<void> signOutUser() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
