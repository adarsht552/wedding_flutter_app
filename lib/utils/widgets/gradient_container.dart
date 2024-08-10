import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wedding/utils/widgets/blur_widget.dart';

class GradientContainer extends StatelessWidget {
  final String svgPath;
  final String title;
  final String subTitle;

  const GradientContainer(
      {super.key,
      required this.svgPath,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 130.w,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xffB70000),
            Color(0xff9A0000),
            Color(0xffFFEA9E),
          ],
          stops: [
            0.0,
            0.3,
            0.9,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10.h),
          SvgPicture.asset(svgPath),
          SizedBox(height: 10.h),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
          ),
          BlurWidget(
            child: Text(
              subTitle,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontFamily: 'Questial', color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}