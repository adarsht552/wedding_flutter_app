import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding/utils/UI/drawer.dart';
import 'package:wedding/utils/UI/first_page_card.dart';
import 'package:wedding/utils/UI/search_bar.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: CustomSearchBar(
            controller: _controller,
            onBackPressed: () {},
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Builder(
              builder: (context) {
                return InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    width:
                        56.0, // Ensures the container is large enough for both images
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            color: const Color.fromARGB(255, 226, 192, 91),
                            "assets/Ellipse.png",
                            height: 30.h,
                          ),
                        ),
                        Positioned(
                          child: Image.asset(
                            "assets/menu.png",
                            height: 25.h, // Adjust the size of the menu icon
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          actions: [
            Container(
              width:
                  56.0, // Ensures the container is large enough for both images
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      color: const Color.fromARGB(255, 226, 192, 91),
                      "assets/Ellipse.png",
                      height: 30.h,
                    ),
                  ),
                  Positioned(
                    child: Image.asset(
                      "assets/Group.png",
                      height: 25.h, // Adjust the size of the menu icon
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        drawer: const DrawerWidget(),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Arrivals",
                    style:
                        TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(color: Colors.amber, fontSize: 15.sp),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HomeCard(),
                    SizedBox(
                      width: 10,
                    ),
                    HomeCard(),
                    SizedBox(
                      width: 10,
                    ),
                    HomeCard(),
                    SizedBox(
                      width: 10,
                    ),
                    HomeCard(),
                    SizedBox(
                      width: 10,
                    ),
                    HomeCard(),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
