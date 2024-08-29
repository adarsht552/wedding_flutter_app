import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'trending_container.dart';

class TrendingListView extends StatelessWidget {
  TrendingListView({super.key});

  final List<Map<String, String>> trendingData = [
    {
      'imagePath': 'assets/images/pari.png',
      'title': 'Bali Motel Vung Tau',
      'location': 'Indonesia',
      'rating': '4.9',
      'price': '₹590/night',
      'discount': '25% OFF'
    },
    {
      'imagePath': 'assets/images/pari.png',
      'title': 'London Eye View',
      'location': 'United Kingdom',
      'rating': '4.8',
      'price': '₹850/night',
      'discount': '30% OFF'
    },
    {
      'imagePath': 'assets/images/pari.png',
      'title': 'Santorini Retreat',
      'location': 'Greece',
      'rating': '4.7',
      'price': '₹720/night',
      'discount': '20% OFF'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: trendingData.length,
        itemBuilder: (context, index) => TrendingContainer(
          imagePath: trendingData[index]['imagePath']!,
          title: trendingData[index]['title']!,
          location: trendingData[index]['location']!,
          rating: trendingData[index]['rating']!,
          price: trendingData[index]['price']!,
          discount: trendingData[index]['discount']!,
        ),
      ),
    );
  }
}
