import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wedding/models/google_auth.dart';
import 'package:wedding/screens/success_screen.dart';
import 'package:wedding/screens/mobile_otp_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  final GoogleAuth googleAuth = GoogleAuth();
  bool isJoinButtonLoading = false;
  bool isGoogleButtonLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return LayoutBuilder(
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
                    top: -10.h,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/dadfs3.png", height: 0.2.sh),
                        Image.asset("assets/8363648 1.png", height: 0.24.sh),
                        Image.asset("assets/Header.png",
                            height: 0.078.sh, fit: BoxFit.scaleDown),
                        Transform.translate(
                          offset: Offset(0, -50.h),
                          child: Image.asset("assets/516.png",
                              width: double.infinity, fit: BoxFit.scaleDown),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Column(
                    children: [
                      const Spacer(flex: 1),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.1.sw),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isJoinButtonLoading = true;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            ).then((_) {
                              setState(() {
                                isJoinButtonLoading = false;
                              });
                            });
                          },
                          child: isJoinButtonLoading
                              ? CircularProgressIndicator()
                              : Image.asset('assets/Join button.png'),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      const Text(
                        'OR',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.1.sw),
                        child: Image.asset('assets/apple2.png'),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.1.sw),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(40),
                          onTap: () async {
                            setState(() {
                              isGoogleButtonLoading = true;
                            });
                            User? user = await googleAuth.signInWithGoogle();
                            setState(() {
                              isGoogleButtonLoading = false;
                            });
                            if (user != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SuccessScreen()),
                              );
                              print('User signed in: ${user.displayName}');
                            } else {
                              print('Sign-in failed or cancelled');
                            }
                          },
                          child: isGoogleButtonLoading
                              ? CircularProgressIndicator()
                              : Image.asset('assets/google1.png'),
                        ),
                      ),
                      Image.asset(
                        'assets/Footer.png',
                        height: 0.1.sh,
                        width: 0.6.sw,
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
