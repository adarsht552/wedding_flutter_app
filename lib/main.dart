import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:wedding/authstae/auth.dart';
import 'package:wedding/firebase_options.dart';
import 'package:wedding/screens/HomeP1.dart';
import 'package:wedding/screens/mobile_OTP_screen.dart';
import 'package:wedding/screens/singUp_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  // Ensure that widget binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Activate Firebase App Check
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity, // Use playIntegrity for Android
    appleProvider: AppleProvider.deviceCheck, // Use deviceCheck for iOS
  );

  // Run the Flutter app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Auth(),
          routes: {
            '/SingIn': (context) => SignUpScreen(),
            '/SingUp': (context) => const SingUp(),
          },
        );
      },
    );
  }
}
