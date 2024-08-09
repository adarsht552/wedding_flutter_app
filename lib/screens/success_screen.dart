import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding/utils/UI/drawer.dart';
import 'package:wedding/utils/UI/search_bar.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
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
      body: Center(
        child: Text('Content of Success Screen'),
      ),
    );
  }
}
