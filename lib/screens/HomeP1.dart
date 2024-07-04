import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirstPage extends StatelessWidget {
  final String imagePath =
      'homePage1/vertical-1606200906-transformed 1.png'; // Path relative to Firebase Storage bucket

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/first.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0.57.sh,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/516.png',colorBlendMode: BlendMode.srcOut,),
                const Padding(
                  padding:  EdgeInsets.all(16.0),
                  child:  Text(
                    'Create memories that last a lifetime',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color:Color(0xFFFFFDD0)),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 0.100.sh,
              left: 0,
              right: 0,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                InkWell(
                  onTap: () {
                  
                  },
                  child: Image.asset(
                    
                    'assets/Joinbutton.png',
                    height: 0.060.sh,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/SingUp');
                  },
                  child: Image.asset('assets/sign in button.png', height: 0.060.sh)),
              ])),
        ]),
      ),
    );
  }
}
