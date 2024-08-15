import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Positioned(
          left: 10,
          top: 40,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 18,
                    height: 2,
                    color: Colors.black,
                    margin: EdgeInsets.symmetric(vertical: 2),
                  ),
                  Container(
                    width: 18,
                    height: 2,
                    color: Colors.black,
                    margin: EdgeInsets.symmetric(vertical: 2),
                  ),
                  Container(
                    width: 18,
                    height: 2,
                    color: Colors.black,
                    margin: EdgeInsets.symmetric(vertical: 2),
                  ),
                ],
              ),
            ),
          ),
        ),
        Drawer(
          // Rest of your Drawer code remains the same
        ),
      ],
    );
  }
}