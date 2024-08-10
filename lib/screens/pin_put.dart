import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinPut extends StatelessWidget {
  final TextEditingController otp = TextEditingController();
   PinPut({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 43, 52),
      body:  Center(
        child: Pinput(
         length: 6,
         animationCurve: Curves.bounceIn,
         autofocus: true,
        controller: otp,
        ),
      ),
    );
  }
}
