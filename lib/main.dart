import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wedding/authstae/auth.dart';
import 'package:wedding/firebase_options.dart';
import 'package:wedding/screens/HomeP1.dart';
import 'package:wedding/screens/mobile_OTP_screen.dart';
import 'package:wedding/screens/singUp_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity, // Use playIntegrity for Android
    appleProvider: AppleProvider.deviceCheck, // Use deviceCheck for iOS
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Auth(),
      routes: {
        '/SingIn': (context) => SignUpScreen(),
        '/SingUp': (context) => SingUp(),
      },
    );
  }
}
