import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding/utils/widgets/faq_widget.dart';
import 'package:wedding/utils/widgets/header_widget.dart';
import 'package:wedding/utils/widgets/trending_list.dart';
import 'package:wedding/utils/widgets/wedding_invite_container.dart';

class WeddingInviteScreen extends StatelessWidget {
  WeddingInviteScreen({super.key});

  final List<String> section1Images = [
    'assets/images/pari.png',
    'assets/images/pari.png',
    'assets/images/pari.png',
    'assets/images/pari.png',
    'assets/images/pari.png',
    // Add more image
  ];
  final List<String> section2Images = [
    'assets/images/pari.png',
    'assets/images/pari.png',
    'assets/images/pari.png',
    'assets/images/pari.png',
    'assets/images/pari.png',
    // Add more image
  ];
  final List<String> section3Images = [
    'assets/images/pari.png',
    'assets/images/pari.png',
    'assets/images/pari.png',
    'assets/images/pari.png',
    'assets/images/pari.png',
    // Add more image
  ];
  final List<String> section4Images = [
    'assets/images/pari.png',
    'assets/images/pari.png',
    'assets/images/pari.png',
    'assets/images/pari.png',
    'assets/images/pari.png',
    // Add more image
  ];

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(
                  controller: controller,
                  onBackPressed: () {},
                  text: "Wedding\nInvite"),
              buildSection(
                context,
                title: "Full Invitation",
                imagePaths: section1Images,
              ),
              buildSection(
                context,
                title: "Save the date",
                imagePaths: section2Images,
              ),
              buildSection(
                context,
                title: "Countdowns",
                imagePaths: section3Images,
              ),
              buildSection(
                context,
                title: "Wardroble Planner",
                imagePaths: section4Images,
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0.w),
                  child: Text(
                    "Trending",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 26.sp),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              TrendingListView(),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Text(
                    "FAQs",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 24.sp),
                  ),
                ),
              ),
              FaqWidget(),
              SizedBox(height: 20.h),
              Text(
                "Still stuck? We're just an email away",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(330.w, 20.h),
                    backgroundColor: const Color(0xff9A2143),
                    foregroundColor: Colors.white),
                child: Text(
                  "Send a message",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white, fontSize: 16),
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildSection(BuildContext context,
    {required String title, required List<String> imagePaths}) {
  return Padding(
    padding: EdgeInsets.only(left: 10.w, top: 10.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 26.sp),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "see all",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 16.sp, color: const Color(0xffBD5900)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 220.h,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 1.0.w),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return WeddingInviteContainer(
                imagePath: imagePaths[index],
              );
            },
          ),
        ),
      ],
    ),
  );
}
