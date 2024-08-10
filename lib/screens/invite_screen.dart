import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:wedding/utils/widgets/bottom_bar.dart';
import 'package:wedding/utils/widgets/drawer.dart';
import 'package:wedding/utils/widgets/search_bar.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({super.key});

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int selectedIndex = 0;
  // int _selectedIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   _selectedIndex = 0;
  // }
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
            color: const Color(0xffF4F4F4),
          ),
          borderRadius: BorderRadius.circular(19),
          boxShadow: selectedIndex == index
              ? [
                  const BoxShadow(
                    offset: Offset(5, 16),
                    color: Color(0xffECDDCA),
                    spreadRadius: 0,
                    blurRadius: 20,
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
                  selectedIndex == index ? Colors.pink : Colors.black54,
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

  Widget popularContainer() {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchBar(controller: controller, onBackPressed: () {}),
              SizedBox(height: 10.h),
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
                    labels: const [
                      'Customise your invite',
                      'Use existing invite'
                    ],
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
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.0.h),
                child: Row(
                  children: [
                    Text(
                      "Popular Themes",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: const Color(0xffD99221),
                                ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                child: SizedBox(
                  height: 150.h,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, indeex) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: popularContainer(),
                        );
                      }),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Text(
                      "AI Generated Themes",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: const Color(0xffD99221),
                                ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                child: SizedBox(
                  height: 150.h,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, indeex) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: popularContainer(),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const DrawerWidget(),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _currentIndex, onTap: _onItemTapped),
    );
  }
}
