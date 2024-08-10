import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onBackPressed;
  final bool notificationOccurr;

  const CustomSearchBar({
    super.key,
    required this.controller,
    this.hintText = 'Search your requirements',
    required this.onBackPressed,
    this.notificationOccurr = true, //change krle tere hisab se
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      child: Row(
        children: [
          Builder(
            builder: (context) {
              return InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(2, 1),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "assets/images/menu.png",
                    height: 20.h,
                  ),
                ),
              );
            },
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: const Color.fromARGB(
                      255, 226, 192, 91), // Golden border color
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
                      style: TextStyle(fontSize: 18.sp),
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(right: 12.0.w),
                      child: SvgPicture.asset(
                        "assets/svg/search.svg",
                        colorFilter: const ColorFilter.mode(
                            Colors.black54, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(2, 1),
                    ),
                  ],
                ),
                child: SvgPicture.asset("assets/svg/bell.svg"),
              ),
              if (notificationOccurr) // Replace with condition
                Positioned(
                  right: 5.r,
                  top: 5.r,
                  child: Container(
                    width: 12.r,
                    height: 12.r,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.red,
                        width: 3.r,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
