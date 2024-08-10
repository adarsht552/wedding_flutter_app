import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding/utils/widgets/new_arrivals_container.dart';
import 'package:wedding/utils/widgets/search_bar.dart';

class NewArrivalsScreen extends StatelessWidget {
  NewArrivalsScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchBar(
                controller: controller,
                onBackPressed: () {},
              ),
              SizedBox(
                height: 100.h,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/design.png",
                      color: Colors.black,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "New Arrivals",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 32.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Wrap(
                spacing: 10.w,
                runSpacing: 20.h,
                children: const [
                  NewArrivalsContainer(
                      imagePath: "", title: "WEDDING INVITATION"),
                  NewArrivalsContainer(imagePath: "", title: "CRAFT YOU WALLS"),
                  NewArrivalsContainer(
                      imagePath: "", title: "CUSTOM NEON LIGHTS"),
                  NewArrivalsContainer(
                      imagePath: "", title: "MAKE YOUR #HASHTAG"),
                  NewArrivalsContainer(imagePath: "", title: "WED STATIONARY"),
                  NewArrivalsContainer(
                      imagePath: "", title: "PERSONALISED GIFT"),
                  NewArrivalsContainer(imagePath: "", title: "PHOTO\nBOOKS"),
                  NewArrivalsContainer(
                      imagePath: "", title: "WEDDING MAGAZINE"),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                "Have the wedding of your dreams\nwithout giving up on your dreams,\nAll your wedding planning needs in one\nplace",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
