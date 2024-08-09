import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:wedding/utils/UI/drawer.dart';
import 'package:wedding/utils/UI/search_bar.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({super.key});

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  int selectedIndex = 0;
  // int _selectedIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   _selectedIndex = 0;
  // }
  Widget buildContainer(
      IconData icon, String title, int index, VoidCallback onTap) {
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
            Icon(icon,
                color: selectedIndex == index ? Colors.pink : Colors.black54),
            SizedBox(height: 8.h),
            Text(
              title,
              style: TextStyle(
                  color: selectedIndex == index
                      ? const Color(0xff9A2143)
                      : Colors.black54),
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                child: Row(
                  children: [
                    Builder(builder: (context) {
                      return InkWell(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(2, 1),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            "assets/menu.png",
                            height: 20.h,
                          ),
                        ),
                      );
                    }),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomSearchBar(
                        controller: controller,
                        onBackPressed: () {},
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(2, 1),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.notifications_active_outlined)),
                  ],
                ),
              ),
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
                    minWidth: 150.0.w,
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
                    buildContainer(Icons.mail, "VIDEO\nINVITE", 0, () {}),
                    SizedBox(width: 10.w),
                    buildContainer(
                        Icons.document_scanner, "PDF\nINVITE", 1, () {}),
                    SizedBox(width: 10.w),
                    buildContainer(Icons.location_on_outlined,
                        "3D INSTA INVITE", 2, () {}),
                    SizedBox(width: 10.w),
                    buildContainer(Icons.mic, "VOICE\nINVITE", 3, () {}),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Row(
                  children: [
                    const Text(
                      "Popular Themes",
                      style: TextStyle(fontSize: 22),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          color: Color(0xffD99221),
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
                    const Text(
                      "AI Generated Themes",
                      style: TextStyle(fontSize: 22),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          color: Color(0xffD99221),
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
    );
  }
}
