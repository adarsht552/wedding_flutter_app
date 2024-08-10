import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewArrivalsContainer extends StatelessWidget {
  final String imagePath;
  final String title;

  const NewArrivalsContainer({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        gradient: const LinearGradient(
          colors: [Colors.black, Colors.transparent],
          stops: [0.0, 0.4],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // Positioned.fill(
          //   child: Image.asset(
          //     imagePath,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Positioned(
            bottom: 10.h,
            left: 10.w,
            right: 10.w,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
