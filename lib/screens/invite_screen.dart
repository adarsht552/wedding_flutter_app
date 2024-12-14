import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedding/utils/widgets/drawer.dart';
import 'package:wedding/utils/widgets/faq_widget.dart';
import 'package:wedding/utils/widgets/header_widget.dart';
import 'package:wedding/utils/widgets/horizontal_container.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({super.key});

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  int selectedIndex = 0;

  Widget inviteContainer(
      String svgPath, String title, int index, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        onTap();
      },
      child: Container(
        height: 110.h,
        width: 78.w,
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? const Color(0xffF4D18E)
              : Colors.transparent,
          border: Border.all(
              color:
                  selectedIndex == index ? Colors.transparent : Colors.black12),
          borderRadius: BorderRadius.circular(19),
          boxShadow: selectedIndex == index
              ? [
                  const BoxShadow(
                    offset: Offset(5, 12),
                    color: Color(0xffECDDCA),
                    spreadRadius: 0,
                    blurRadius: 10,
                  )
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgPath,
              colorFilter: ColorFilter.mode(
                  selectedIndex == index
                      ? Colors.pink
                      : const Color(0xff9A999E),
                  BlendMode.srcIn),
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: selectedIndex == index
                        ? const Color(0xff9A2143)
                        : Colors.black54,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      drawer: const DrawerWidget(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(
                  controller: controller,
                  onBackPressed: () {},
                  text: 'Invites'),
              SizedBox(height: 10.h),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
                child: Row(
                  children: [
                    inviteContainer(
                        "assets/svg/vid_invite.svg", "VIDEO\nINVITE", 0, () {}),
                    SizedBox(width: 10.w),
                    inviteContainer(
                        "assets/svg/pdf_invite.svg", "PDF\nINVITE", 1, () {}),
                    SizedBox(width: 10.w),
                    inviteContainer("assets/svg/insta_invite.svg",
                        "3D INSTA INVITE", 2, () {}),
                    SizedBox(width: 10.w),
                    inviteContainer("assets/svg/voice_invite.svg",
                        "VOICE\nINVITE", 3, () {}),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              const HorizontalContainer(
                title: "Weddings",
                subTitle: "Traditional, Modern, Thematic",
                svgPath: "assets/svg/design1.svg",
                alignment: MainAxisAlignment.start,
                colors: [
                  Color(0xffB30000),
                  Color(0xffFF6097),
                ],
                isSvgFirst: true,
              ),
              SizedBox(height: 10.h),
              const HorizontalContainer(
                title: "Pre-Weddings Events",
                subTitle: "Engagement, Mehendi, Sangeet, Haldi",
                svgPath: "assets/svg/design1.svg",
                alignment: MainAxisAlignment.end,
                colors: [
                  Color(0xffACC9FF),
                  Color(0xff497AF7),
                ],
                isSvgFirst: false,
              ),
              SizedBox(height: 10.h),
              const HorizontalContainer(
                title: "Festivals",
                subTitle: "Ganesh Pooja, Diwali, Dussehra, etc",
                svgPath: "assets/svg/design1.svg",
                alignment: MainAxisAlignment.start,
                colors: [
                  Color(0xffBD5E11),
                  Color(0xffE5C17E),
                ],
                isSvgFirst: true,
              ),
              SizedBox(height: 10.h),
              const HorizontalContainer(
                title: "Special Ocassions",
                subTitle: "Anniversaries, Milestones, Birthdays",
                svgPath: "assets/svg/design1.svg",
                alignment: MainAxisAlignment.end,
                colors: [
                  Color(0xff2B975D),
                  Color(0xff023D2F),
                ],
                isSvgFirst: false,
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Text(
                    "Exclusive Deals",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  height: 140.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffC9660F),
                        Color(0xffFF5D39),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get you 30%\ndiscount now!",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 10.h),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff9A2143),
                            foregroundColor: Colors.white),
                        child: Text(
                          "Order now",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
