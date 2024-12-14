import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendingContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final String rating;
  final String price;
  final String discount;
  const TrendingContainer(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.location,
      required this.rating,
      required this.price,
      required this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0.w),
      width: 350.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0.w),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 35.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(32.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    discount,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 140.h),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
                gradient: const LinearGradient(
                  colors: [
                    Colors.black87,
                    Colors.black12,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            left: 16.w,
            bottom: 25.h,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 16.w,
            bottom: 5.h,
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 16.w,
            bottom: 25.h,
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16.sp),
                SizedBox(width: 4.w),
                Text(
                  rating,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 16.w,
            bottom: 4.h,
            child: Text(
              price,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
