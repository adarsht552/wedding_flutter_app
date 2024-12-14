import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GradientContainer extends StatelessWidget {
  final String svgPath;
  final String title;
  final String subTitle;
  final List<Color> colors;

  const GradientContainer(
      {super.key,
      required this.svgPath,
      required this.title,
      required this.subTitle,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.h,
      width: 109.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          stops: const [
            0.0,
            0.3,
            0.9,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10.h),
          SvgPicture.asset(
            svgPath,
            height: 35.h,
            width: 35.w,
          ),
          SizedBox(height: 10.h),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          // BlurWidget(
          //   child: Text(
          //     subTitle,
          //     style: Theme.of(context).textTheme.bodySmall!.copyWith(
          //         fontFamily: 'Questial',
          //         color: Colors.white,
          //         fontSize: 9.sp,
          //         fontWeight: FontWeight.bold),
          //     textAlign: TextAlign.center,
          //     maxLines: 2,
          //   ),
          // ),
        ],
      ),
    );
  }
}
