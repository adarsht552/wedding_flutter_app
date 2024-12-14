import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding/screens/new_arrivals_screen.dart';
import 'package:wedding/utils/widgets/new_arrivals_container.dart';
import 'package:wedding/utils/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomSearchBar(controller: controller, onBackPressed: () {}),
            Padding(
              padding: EdgeInsets.only(left: 12.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Arrivals",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 28.sp),
                  ),
                  // const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewArrivalsScreen()));
                    },
                    child: Text(
                      "see all",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontSize: 16.sp, color: const Color(0xffBD5900)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 140.h,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  const NewArrivalsContainer(
                      imagePath: "", title: "INVITATION SUITE"),
                  SizedBox(width: 10.w),
                  const NewArrivalsContainer(
                      imagePath: "", title: "CRAFT YOU WALLS"),
                  SizedBox(width: 10.w),
                  const NewArrivalsContainer(
                      imagePath: "", title: "CUSTOM NEON LIGHTS"),
                  SizedBox(width: 10.w),
                  const NewArrivalsContainer(
                      imagePath: "", title: "MAKE YOUR #HASHTAG"),
                  SizedBox(width: 10.w),
                  const NewArrivalsContainer(
                      imagePath: "", title: "WEDDING MAGAZINE"),
                  SizedBox(width: 10.w),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.only(left: 12.0.w),
              child: Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    text: "India's First AI Powered",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "\nWedding Manager - Mangalyam",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: const Color(0xff9A2143), fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
