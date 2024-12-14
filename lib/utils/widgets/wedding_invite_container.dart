import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeddingInviteContainer extends StatelessWidget {
  final String imagePath;

  const WeddingInviteContainer({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      margin: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(imagePath, fit: BoxFit.fill),
      ),
    );
  }
}
