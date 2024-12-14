import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HorizontalContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final String svgPath;
  final MainAxisAlignment alignment;
  final List<Color> colors;
  final bool isSvgFirst;
  const HorizontalContainer(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.svgPath,
      required this.alignment,
      required this.colors,
      required this.isSvgFirst});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Container(
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.0.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: alignment,
                children: isSvgFirst
                    ? [
                        SvgPicture.asset(
                          svgPath,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          title,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                    fontFamily: 'Questrial',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        )
                      ]
                    : [
                        Text(
                          title,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                    fontFamily: 'Questrial',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(width: 8.w),
                        SvgPicture.asset(svgPath)
                      ],
              ),
              Row(
                mainAxisAlignment: alignment,
                children: [
                  Text(
                    subTitle,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontFamily: 'Questrial',
                        fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
