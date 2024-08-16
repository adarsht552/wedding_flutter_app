import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wedding/firebase_options.dart';
import 'package:wedding/screens/invite_screen.dart';
import 'package:wedding/screens/mobile_otp_screen.dart';
import 'package:wedding/screens/singUp_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding/utils/theme/text_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider:
        AndroidProvider.playIntegrity, // Use playIntegrity for Android
    appleProvider: AppleProvider.deviceCheck, // Use deviceCheck for iOS
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: textTheme,
          home: InviteScreen(),
          routes: {
            '/SingIn': (context) => const SignUpScreen(),
            '/SingUp': (context) => const SingUp(),
          },
        );
      },
    );
  }
}
