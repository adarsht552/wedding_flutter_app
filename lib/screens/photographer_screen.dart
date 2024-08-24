import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding/screens/photographer_detail_screen.dart';
import 'package:wedding/models/photoartists_item.dart';
import 'package:wedding/models/photographer_detail_screen_data.dart';
import 'package:wedding/utils/widgets/filter_widget.dart';
import 'package:wedding/utils/widgets/services_header.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:wedding/utils/widgets/staggered_grid.dart';

class PhotographerScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  PhotographerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ServicesHeader(
                controller: controller,
                onBackPressed: () {},
                text1: "Image",
                svgPath: 'assets/svg/camera.svg',
                text2: "Makers",
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 178.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return buildHorizontalContainer(const Color(0xffDFE6ED));
                  },
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 14.0.w),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Mesmerizer",
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: const Color(0xffDF005E),
                                    fontSize: 16,
                                  ),
                        ),
                        TextSpan(
                          text: "  Photoartists",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: const Color(0xffDF005E),
                                    fontSize: 16,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: photographers.length,
                  itemBuilder: (context, index) {
                    return photographersContainer(
                      context: context,
                      photographer: photographers[index],
                    );
                  },
                ),
              ),
              const FilterWidget(),
              DottedDashedLine(
                axis: Axis.horizontal,
                height: 0.h,
                width: 330.w,
                dashColor: Colors.black12,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 12.0.w),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Top 44 Photoartists to explore",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 1000.h, // increase height when new grid items are aded
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                  child: StaggeredGridViewWidget(items: gridItems),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildHorizontalContainer(Color color) {
  return Padding(
    padding: EdgeInsets.all(8.0.r),
    child: Container(
      width: 360.w,
      decoration: BoxDecoration(
        color: const Color(0xffDFE6ED),
        borderRadius: BorderRadius.circular(28),
      ),
    ),
  );
}

Widget photographersContainer({
  required BuildContext context,
  required Map<String, dynamic> photographer,
}) {
  return Padding(
    padding: EdgeInsets.all(8.0.r),
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotographerDetailsScreen(
              photographer: photographer,
            ),
          ),
        );
      },
      child: Container(
        width: 170.w,
        decoration: BoxDecoration(
          color: const Color(0xffDFE6ED),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundImage: NetworkImage(
                  photographer['avatar'] ?? 'https://via.placeholder.com/80'),
            ),
            SizedBox(height: 10.h),
            Text(
              photographer['title'] ?? 'Untitled',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              photographer['name'] ?? 'Unknown',
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (starIndex) => Icon(
                  Icons.star,
                  color: starIndex < (photographer['rating'] as int? ?? 0)
                      ? Colors.amber
                      : Colors.grey,
                  size: 20.r,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
