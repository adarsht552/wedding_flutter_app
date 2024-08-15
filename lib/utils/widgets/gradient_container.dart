import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wedding/utils/widgets/blur_widget.dart';

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
      height: 130.h,
      width: 110.w,
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
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 5.h),
          SvgPicture.asset(
            svgPath,
            height: 25.h,
            width: 25.w,
          ),
          SizedBox(height: 2.h),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          BlurWidget(
            child: Text(
              subTitle,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontFamily: 'Questial', color: Colors.white, fontSize: 12),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
