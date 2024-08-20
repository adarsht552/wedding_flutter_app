import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedding/utils/widgets/services_searchbar.dart';

class ServicesHeader extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onBackPressed;
  final String text1;
  final String text2;
  final String svgPath;

  const ServicesHeader({
    super.key,
    required this.controller,
    required this.onBackPressed,
    required this.text1,
    required this.text2,
    required this.svgPath,
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
                  color: const Color.fromARGB(255, 248, 170, 184),
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
                      Color(0xffFF859B), BlendMode.srcIn),
                ),
              ),
              Positioned(
                top: 0.01.sh,
                left: 0.01.sw,
                right: 0.01.sw,
                child: ServicesSearchbar(
                  controller: controller,
                  onBackPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              Positioned(
                top: 0.09.sh,
                left: 0.25.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text1,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 0.03.sh,
                                color: const Color(0xffFF859B),
                              ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 6.w),
                    SvgPicture.asset(svgPath),
                    SizedBox(width: 5.w),
                    Text(
                      text2,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 0.03.sh,
                                color: const Color(0xffFF859B),
                              ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
