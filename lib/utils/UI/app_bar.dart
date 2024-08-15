import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding/utils/UI/search_bar.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: CustomSearchBar(
        controller: _controller,
        onBackPressed: () {},
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Transform.translate(
              offset: Offset(5, 0),
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.amber.withOpacity(0.2)), // Adjust opacity here
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
                        margin: const EdgeInsets.symmetric(vertical: 2),
                      ),
                      Container(
                        width: 18,
                        height: 2,
                        color: Colors.black,
                        margin: const EdgeInsets.symmetric(vertical: 2),
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
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            width: 35.w,
            height: 35.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.amber.withOpacity(0.1)), // Adjust opacity here
              color: Colors.white.withOpacity(0.5), // Adjust opacity here
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ImageIcon(
              const AssetImage("assets/Group.png"),
              size: 20.sp,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
