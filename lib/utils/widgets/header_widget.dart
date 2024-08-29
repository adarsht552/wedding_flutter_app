import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedding/utils/widgets/search_bar.dart';

class HeaderWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onBackPressed;
  final String text;

  const HeaderWidget({
    super.key,
    required this.controller,
    required this.onBackPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: 0.20.sh,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/Vector_34.png',
                  color: const Color(0xffD6C29B),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 10,
                child: SvgPicture.asset(
                  "assets/svg/Vector_35.svg",
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                      Color(0xffCDB67E), BlendMode.srcIn),
                ),
              ),
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
                top: 0.08.sh,
                left: 0,
                right: 0,
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 0.04.sh,
                        color: const Color(0xffD6A74F),
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
