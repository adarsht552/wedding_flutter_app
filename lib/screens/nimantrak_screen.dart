import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:wedding/screens/invite_screen.dart';
import 'package:wedding/utils/widgets/drawer.dart';
import 'package:wedding/utils/widgets/faq_widget.dart';
import 'package:wedding/utils/widgets/header_widget.dart';

class NimantrakScreen extends StatelessWidget {
  NimantrakScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(
                controller: controller,
                onBackPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                text: 'Nimantrak',
              ),
              SizedBox(height: 20.h),
              Container(
                height: 54.h,
                decoration: BoxDecoration(
                  color: const Color(0xffF6F5F9),
                  border: Border.all(
                    color: const Color(0xffE6D6B8),
                  ),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(32.r),
                    right: Radius.circular(32.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0.r),
                  child: ToggleSwitch(
                    minWidth: 160.0.w,
                    cornerRadius: 20.0.r,
                    activeBgColors: const [
                      [Color(0xff9A2143)],
                      [Color(0xff9A2143)]
                    ],
                    activeFgColor: Colors.white,
                    inactiveBgColor: const Color(0xffF6F5F9),
                    inactiveFgColor: const Color(0xff9A2143),
                    initialLabelIndex: 0,
                    totalSwitches: 2,
                    labels: const ['Create your invite', 'Use existing invite'],
                    customTextStyles: [
                      TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                    radiusStyle: true,
                    onToggle: (index) {
                      //      setState(() {
                      //   _selectedIndex = index!;
                      // });
                      // if(index == 1){
                      //   Navigator.pushNamed(context, '/existinginvite').then((_) {
                      //             setState(() {
                      //       _selectedIndex = 0;
                      //     });
                      //   });
                      // }
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              SvgPicture.asset("assets/svg/create_new.svg"),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InviteScreen()));
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(10.w, 30.h),
                    backgroundColor: const Color(0xff9A2143),
                    foregroundColor: Colors.white),
                child: Text(
                  "Create Now",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: 20.h),
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
