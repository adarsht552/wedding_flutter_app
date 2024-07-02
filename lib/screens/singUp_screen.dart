import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wedding/models/googleOauth.dart';
import 'package:wedding/screens/SuccessScreen.dart';
import 'package:wedding/screens/mobile_OTP_screen.dart';
import 'package:wedding/utils/buttons.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  final GoogleAuth googleAuth = GoogleAuth();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Vector34.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 25,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset("assets/8363648 1.png"),
                    Image.asset("assets/Header.png", height: 100, width: 200),
                    Image.asset("assets/Vector35.png"),
                  ],
                ),
              ),
              Column(
                children: [
                  const Spacer(flex: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Buttons(
                      name: 'Continue with Phone',
                      color: const Color.fromARGB(255, 145, 45, 11),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      },
                      imagePath: 'assets/phone.png',
                    ),
                  ),
                  const Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Buttons(
                      name: 'Continue with Apple',
                      color: const Color.fromARGB(255, 203, 207, 211),
                      onPressed: () {},
                      imagePath: 'assets/apple.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Buttons(
                      name: 'Continue with Google',
                      color: const Color.fromARGB(255, 217, 222, 226),
                      onPressed: _isLoading ? null : _signInWithGoogle,
                      imagePath: 'assets/Google.png',
                      child: _isLoading
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                            )
                          : null,
                    ),
                  ),
                  Image.asset(
                    'assets/Footer.png',
                    height: constraints.maxHeight * 0.1,
                    width: constraints.maxWidth * 0.6,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });

    User? user = await googleAuth.signInWithGoogle();

    setState(() {
      _isLoading = false;
    });

    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuccessScreen()),
      );
      print('User signed in: ${user.displayName}');
    } else {
      print('Sign-in failed or cancelled');
    }
  }
}
