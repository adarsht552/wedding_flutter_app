import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onBackPressed;

  const CustomSearchBar({
    super.key,
    required this.controller,
    this.hintText = 'Search your requirements',
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: const Color.fromARGB(255, 226, 192, 91), // Golden border color
          width: .0,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 18),
            onPressed: onBackPressed,
            iconSize: 24.sp,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(fontSize: 16.sp),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 14.sp, color: Colors.black26),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.search_outlined,
              color: Color(0xffABADBC),
            ),
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
