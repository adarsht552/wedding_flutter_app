import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wedding/screens/first_page.dart';
import 'package:wedding/screens/success_screen.dart';



class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Check if authentication state is available and not null
          if (snapshot.hasData && snapshot.data != null) {
            // User is authenticated, navigate to HomePage
            return  const SuccessScreen(
            );
          } else {
            // User is not authenticated, show LoginPage
            return   FirstPage();
          }
        },
      ),
    );
  }
}