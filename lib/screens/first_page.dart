import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding/screens/singUp_screen.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  // Path relative to Firebase Storage bucket

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Cover_copy.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0.73.sh,
            left: 0,
            right: 0,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Create memories that last a lifetime',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFDD0)),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0.080.sh,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SingUp(),
                      ),
                    );
                  },
                  child: Image.asset('assets/sign in button.png',
                      height: 0.060.sh),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
