import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnesssl/pages/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitnesssl/pages/messenger/chat_home.dart';
import 'package:fitnesssl/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            // return HomePage();
            return const ChatHome();
          }

          // user is NOT logged in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
