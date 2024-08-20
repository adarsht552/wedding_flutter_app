import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding/utils/widgets/filter_screen.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: SizedBox(
        height: 60.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              children: [
                Chip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Sort",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Icon(Icons.sort, size: 14.r),
                    ],
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.r),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
                SizedBox(width: 4.w),
                Chip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Baner",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Icon(Icons.close, size: 14.r),
                    ],
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.r),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
                SizedBox(width: 4.w),
                Chip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Price",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Icon(Icons.arrow_drop_down, size: 14.r),
                    ],
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.r),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
                SizedBox(width: 4.w),
                Chip(
                  label: Text(
                    "Trending",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.r),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
                SizedBox(width: 4.w),
                GestureDetector(
                  onTap: () {
                    _showBottomSheet(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: const Color(0xffDF005E),
                      borderRadius: BorderRadiusDirectional.circular(12),
                    ),
                    child: Icon(
                      Icons.tune,
                      color: Colors.white,
                      size: 20.r,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    showDragHandle: true,
    isScrollControlled: true,
    barrierColor: Colors.black87,
    context: context,
    builder: (context) {
      return const CustomBottomSheet();
    },
  );
}
