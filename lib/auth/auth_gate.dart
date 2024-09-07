import 'package:chatme/auth/login_or_register.dart';
import 'package:chatme/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapShot) {
            // if the user is logged in
            if (snapShot.hasData) {
              return HomePage();

              // if not logged in
            } else {
              return LoginOrRegister();
            }
          }),
    );
  }
}
