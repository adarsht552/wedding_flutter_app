import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onBackPressed;

  CustomSearchBar({
    required this.controller,
    this.hintText = 'Search your requirements',
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: const Color.fromARGB(255, 226, 192, 91), // Golden border color
          width: .0,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 25),
            onPressed: onBackPressed,
            iconSize: 24.sp,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(fontSize: 16.sp),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 14.sp),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () {
              // Add your search functionality here
            },
            iconSize: 24.sp,
          ),
        ],
      ),
    );
  }
}
