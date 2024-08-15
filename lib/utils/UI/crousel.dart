import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding/utils/UI/constants/image.dart';

class MyCarousel extends StatelessWidget {
  const MyCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ExpandableCarousel(
              options: ExpandableCarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                showIndicator: false,
                height: 200.h, // Adjust this value as needed
                viewportFraction: 1.0,
                // enlargeCenterPage: false,
              ),
              items: [
                Image.asset('assets/crousel1.png', fit: BoxFit.cover),
                Image.asset('assets/crousel1.png', fit: BoxFit.cover),
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: i,
                    );
                  },
                );
              }).toList(),
            ),
            Positioned(
              bottom: 20, // Adjust this value to position the button vertically
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'Custom Package',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          width: double
              .infinity, // Ensures the container takes up the full width of the screen
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 30.0), // Adds padding to the content
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(images.frame),
              fit: BoxFit.cover, // The image covers the entire container
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize
                .min, // Makes the column height adapt to its content
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(
                offset: const Offset(0, -25),
                child: Text(
                  'Are you tired?',
                  style: TextStyle(
                    fontSize: 25
                        .sp, // Assumes you're using flutter_screenutil or similar for responsive text
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              //  SizedBox(height: 16.h// Adds space between the title and the description
              Transform.translate(
                offset: const Offset(0, -22),
                child: const Text(
                  'Tired of Looking every single \n vendor of each Service Type? We will \n select a tailored package that best fits \n in your interests',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
     
      ],
    );
  }
}
