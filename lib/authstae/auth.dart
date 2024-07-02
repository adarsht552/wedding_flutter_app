import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wedding/screens/HomeP1.dart';
import 'package:wedding/screens/SuccessScreen.dart';
import 'package:wedding/screens/mobile_OTP_screen.dart';
import 'package:wedding/screens/singUp_screen.dart';


class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

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