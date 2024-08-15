import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding/utils/Tools_card.dart';
import 'package:wedding/utils/UI/app_bar.dart';
import 'package:wedding/utils/UI/crousel.dart';
import 'package:wedding/utils/UI/drawer.dart';
import 'package:wedding/utils/UI/first_page_card.dart';
import 'package:wedding/utils/UI/search_bar.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(),
        drawer: const DrawerWidget(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New Arrivals",
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Seel All",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 15.sp,
                            fontFamily: GoogleFonts.quando().fontFamily,
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const HomeCard(),
                      SizedBox(width: 10.w),
                      const HomeCard(), // Add more HomeCard widgets here if needed
                      SizedBox(width: 10.w),
                      const HomeCard(), // Add more HomeCard widgets here if needed
                      // You can continue adding more HomeCard widgets as required
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
               Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "India's First AI Powered",style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    )),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "𝓌𝑒𝒹𝒹𝒾𝓃𝑔 𝓂𝒶𝓃𝒶𝑔𝑒𝓇-𝓂𝒶𝓃𝑔𝓁𝒶𝓎𝒶𝓂 ", style: TextStyle(fontSize: 20.sp),
                      textAlign: TextAlign.left,
                    )),
              ),
              const MyCarousel(),
//Tools
                 Padding(
          padding:  EdgeInsets.only(left: 10.sp),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Tools',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
              )),
        ),
            Padding(
              padding:  EdgeInsets.only(left: 10.sp),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ToolsCard(),
                    SizedBox(width: 10.w),
                    ToolsCard(),
                    SizedBox(width: 10.w),
                    ToolsCard(),
                  ],
                ),
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}
