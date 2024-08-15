import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlurWidget extends StatelessWidget {
  final Widget child;
  const BlurWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 20, sigmaX: 20),
          child: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.4,
                  color: const Color.fromARGB(255, 226, 192, 91),
                ),
                borderRadius: BorderRadius.circular(22),
                color: Colors.black12,
              ),
              child: child),
        ),
      ),
    );
  }
}
