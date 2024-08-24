import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedding/screens/reservation_screen.dart';

class PhotographerDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> photographer;

  const PhotographerDetailsScreen({
    super.key,
    required this.photographer,
  });

  @override
  PhotographerDetailsScreenState createState() =>
      PhotographerDetailsScreenState();
}

class PhotographerDetailsScreenState extends State<PhotographerDetailsScreen> {
  late String mainImageUrl;

  @override
  void initState() {
    super.initState();
    mainImageUrl = widget.photographer['mainimage'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Stack(
              children: [
                Image.network(
                  mainImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  top: 40.h,
                  left: 16.w,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 40.h,
                  right: 16.w,
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 20.r),
                        SizedBox(width: 5.w),
                        Text(
                          '${widget.photographer['rating']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20.h,
                  left: 16.w,
                  child: IconButton(
                    icon: Icon(Icons.bookmark_border,
                        color: Colors.white, size: 30.r),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  bottom: 20.h,
                  right: 16.w,
                  child: Column(
                    children: [
                      _buildImageThumbnail(widget.photographer['image1']),
                      SizedBox(height: 5.h),
                      _buildImageThumbnail(widget.photographer['image2']),
                      SizedBox(height: 5.h),
                      _buildImageThumbnail(widget.photographer['image3']),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 1.0,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: Stack(
                  children: [
                    ListView(
                      controller: scrollController,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      children: [
                        SizedBox(height: 12.h),
                        Center(
                          child: Text(
                            widget.photographer['title'],
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Center(
                          child: Text(
                            widget.photographer['location'],
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  color: Colors.black45,
                                  fontSize: 16.sp,
                                ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite,
                                color: Colors.grey, size: 20.r),
                            SizedBox(width: 5.w),
                            Text(
                              widget.photographer['experience'],
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color: Colors.black45,
                                    fontSize: 14.sp,
                                  ),
                            ),
                            SizedBox(width: 10.w),
                            Icon(Icons.location_city,
                                color: Colors.grey, size: 20.r),
                            SizedBox(width: 5.w),
                            Text(
                              widget.photographer['avialability'],
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color: Colors.black45,
                                    fontSize: 14.sp,
                                  ),
                            ),
                            SizedBox(width: 10.w),
                            Icon(Icons.thumb_up_sharp,
                                color: Colors.grey, size: 20.r),
                            SizedBox(width: 5.w),
                            Text(
                              'Candid Choice',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color: Colors.black45,
                                    fontSize: 14.sp,
                                  ),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.black12),
                        SizedBox(height: 20.h),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  widget.photographer['avatar'],
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Founder',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                              color: Colors.black54,
                                              fontSize: 14.sp,
                                            ),
                                      ),
                                      SizedBox(width: 5.w),
                                      SvgPicture.asset('assets/svg/badge.svg'),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    widget.photographer['name'],
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.keyboard_arrow_right_sharp,
                                size: 28,
                                color: Colors.black45,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          'Description',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          widget.photographer['desc'],
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: Colors.black54,
                                fontSize: 14.sp,
                              ),
                        ),
                        SizedBox(height: 8.h),
                        const Divider(color: Colors.black12),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Gallery',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildGalleryImage(widget.photographer['image1']),
                              _buildGalleryImage(widget.photographer['image2']),
                              _buildGalleryImage(widget.photographer['image3']),
                              _buildGalleryImage(widget.photographer['image4']),
                              _buildGalleryImage(widget.photographer['image5']),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        DottedDashedLine(
                          height: 0,
                          width: 50.w,
                          axis: Axis.horizontal,
                          dashColor: Colors.black12,
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            discountCard('50% off', 'use code FREE50'),
                            SizedBox(width: 5.w),
                            discountCard(
                                '60% off on Debit Card', 'No coupon required'),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        const Divider(color: Colors.black12),
                        SizedBox(height: 20.h),
                        Text(
                          'Recommended (5)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        recommendedItem('Portrait Shoot', '₹2500', '6/hr'),
                        const Divider(color: Colors.black12),
                        recommendedItem('Candid Shoot', '₹3000', '5/hr'),
                        const Divider(color: Colors.black12),
                        recommendedItem('Candid Shoot', '₹3000', '5/hr'),
                        const Divider(color: Colors.black12),
                        recommendedItem('Candid Shoot', '₹3000', '5/hr'),
                        const Divider(color: Colors.black12),
                        recommendedItem('Candid Shoot', '₹3000', '5/hr'),
                        const Divider(color: Colors.black12),
                        Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0.w, vertical: 18.h),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              height: 70,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Rs 2450",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.black),
                                      ),
                                      Text(
                                        'for 6 hrs',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                                fontSize: 14,
                                                color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ReservationScreen()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: const Color(0xffDF005E),
                                    ),
                                    child: Text(
                                      "Reservation",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildImageThumbnail(String imageUrl) {
    return GestureDetector(
      onTap: () {
        setState(() {
          mainImageUrl = imageUrl;
        });
      },
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.white, width: 2.w),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildGalleryImage(String imageUrl) {
    return Container(
      width: 100.w,
      height: 100.h,
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget discountCard(String title, String description) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10.w),
        margin: EdgeInsets.symmetric(horizontal: 1.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/discount.svg',
                  width: 20.w,
                  height: 20.h,
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 13.sp, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 12.sp, color: Colors.black54),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget recommendedItem(String name, String price, String perHour) {
    return Container(
      height: 110.h,
      padding: EdgeInsets.all(8.w),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              height: 90.h,
              width: 80.w,
              'assets/images/pari.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 20.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.h),
              Text(
                price,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 16.sp,
                      color: Colors.black45,
                    ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/svg/timer.svg'),
                  SizedBox(width: 4.w),
                  Text(
                    perHour,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 14.sp,
                          color: Colors.black45,
                        ),
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {}, // add functionality here
            child: Container(
              height: 25.h,
              width: 70.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffDF005E),
                ),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Select",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 14.sp, color: const Color(0xffDF005E)),
                  ),
                  Icon(
                    Icons.add,
                    size: 18.sp,
                    color: const Color(0xffDF005E),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
