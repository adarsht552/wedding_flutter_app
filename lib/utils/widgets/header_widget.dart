import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding/utils/widgets/search_bar.dart';

class HeaderWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onBackPressed;
  final String text;

  const HeaderWidget({
    super.key,
    required this.controller,
    required this.onBackPressed, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: 0.22.sh,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/images/headerbg.png',
                  fit: BoxFit.cover, color: Colors.red),
              Positioned(
                top: 0.01.sh,
                left: 0.01.sw,
                right: 0.01.sw,
                child: CustomSearchBar(
                  controller: controller,
                  onBackPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/design.png",
                  color: Colors.black,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                top: 0.12.sh,
                left: 0,
                right: 0,
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 0.04.sh,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
