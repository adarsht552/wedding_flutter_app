import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding/utils/widgets/drawer.dart';
import 'package:wedding/utils/widgets/gradient_container.dart';
import 'package:wedding/utils/widgets/header_widget.dart';

class ToolsScreen extends StatelessWidget {
  ToolsScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              HeaderWidget(
                controller: controller,
                onBackPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                text: 'Tools',
              ),
              SizedBox(height: 30.h),
              Wrap(
                spacing: 8.w,
                runSpacing: 10.h,
                children: const [
                  GradientContainer(
                    svgPath: "assets/svg/invite_guest.svg",
                    title: "INVITE\nGUESTS",
                    subTitle: "DESIGNS, SENDS & TRACKS RSVPS",
                    colors: [
                      Color(0xffB70000),
                      Color(0xff9A0000),
                      Color(0xffFFEA9E)
                    ],
                  ),
                  GradientContainer(
                    svgPath: "assets/svg/calc.svg",
                    title: "BUDGET\nCALCULATOR",
                    subTitle: "PLAN YOUR DREAM WEDDING BUDGET",
                    colors: [
                      Color(0xff8D54D7),
                      Color(0xff2F006E),
                      Color(0xffF5F5DC)
                    ],
                  ),
                  GradientContainer(
                    svgPath: "assets/svg/web_builder.svg",
                    title: "WEDDING WEBSITE BUILDER",
                    subTitle: "CREATE YOUR WEDDING WEBSITE",
                    colors: [
                      Color(0xff48A176),
                      Color(0xff072B45),
                      Color(0xffACD2AB)
                    ],
                  ),
                  GradientContainer(
                    svgPath: "assets/svg/hash.svg",
                    title: "WEDDING HASHTAG MAKER",
                    subTitle: "CREATE YOUR WEDDING HASHTAG",
                    colors: [
                      Color(0xffB70000),
                      Color(0xff9A0000),
                      Color(0xffFFEA9E)
                    ],
                  ),
                  GradientContainer(
                    svgPath: "assets/svg/music.svg",
                    title: "MUSIC PLAYLIST MANAGER",
                    subTitle: "PLAN YOUR EVENT PLAYLIST",
                    colors: [
                      Color(0xffFF6363),
                      Color(0xffB34066),
                      Color(0xff671D69)
                    ],
                  ),
                  GradientContainer(
                    svgPath: "assets/svg/monogram.svg",
                    title: "WEDDING LOGO & MONOGRAM",
                    subTitle: "GET YOUR WEDDING LOGO",
                    colors: [
                      Color(0xff004E93),
                      Color(0xff072B45),
                      Color(0xffABBED2)
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
