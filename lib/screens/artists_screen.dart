import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding/utils/widgets/artists_container.dart';
import 'package:wedding/utils/widgets/bottom_bar.dart';
import 'package:wedding/utils/widgets/header_widget.dart';

class ArtistsScreen extends StatefulWidget {
  const ArtistsScreen({super.key});

  @override
  State<ArtistsScreen> createState() => _ArtistsScreenState();
}

class _ArtistsScreenState extends State<ArtistsScreen> {
  int _currentIndex = 0;

  final TextEditingController controller = TextEditingController();

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Add your navigation logic here based on the selected index
    // For example, if index == 0, navigate to the home screen
  }

  // list of data for Artists
  final List<Map<String, dynamic>> artistsData = [
    {
      "svgPath": "assets/svg/dj.svg",
      "title": "DJ",
      "colors": [const Color(0xff65219A), const Color(0xff4A065B)],
    },
    {
      "svgPath": "assets/svg/singer.svg",
      "title": "Singer",
      "colors": [const Color(0xffFF9F43), const Color(0xffFF5722)],
    },
    {
      "svgPath": "assets/svg/photographer.svg",
      "title": "Photo\ngraphers",
      "colors": [const Color(0xff2193b0), const Color(0xff6dd5ed)],
    },
    {
      "svgPath": "assets/svg/mehendi.svg",
      "title": "Mehendi",
      "colors": [const Color(0xffe53935), const Color(0xffe35d5b)],
    },
    {
      "svgPath": "assets/svg/magic.svg",
      "title": "Magician",
      "colors": [const Color(0xff4caf50), const Color(0xff66bb6a)],
    },
    {
      "svgPath": "assets/svg/dancer.svg",
      "title": "Dancer",
      "colors": [const Color(0xff8e44ad), const Color(0xff9b59b6)],
    },
    {
      "svgPath": "assets/svg/choreographer.svg",
      "title": "Choreo\ngraphers",
      "colors": [const Color(0xff2980b9), const Color(0xff3498db)],
    },
    {
      "svgPath": "assets/svg/comedian.svg",
      "title": "Comedian",
      "colors": [const Color(0xffd35400), const Color(0xffe67e22)],
    },
    {
      "svgPath": "assets/svg/joker.svg",
      "title": "Joker",
      "colors": [const Color(0xfff1c40f), const Color(0xfff39c12)],
    },
    {
      "svgPath": "assets/svg/painter.svg",
      "title": "Painter",
      "colors": [const Color(0xffc0392b), const Color(0xffe74c3c)],
    },
    {
      "svgPath": "assets/svg/turban.svg",
      "title": "Turban\nTying",
      "colors": [const Color(0xff16a085), const Color(0xff1abc9c)],
    },
    {
      "svgPath": "assets/svg/caricature.svg",
      "title": "Caricature\nArtists",
      "colors": [const Color(0xff27ae60), const Color(0xff2ecc71)],
    },
    {
      "svgPath": "assets/svg/caligrapher.svg",
      "title": "Calligrapher",
      "colors": [const Color(0xff8e44ad), const Color(0xff9b59b6)],
    },
    {
      "svgPath": "assets/svg/card.svg",
      "title": "Tarot Card\nReaders",
      "colors": [const Color(0xff2980b9), const Color(0xff3498db)],
    },
    {
      "svgPath": "assets/svg/storyteller.svg",
      "title": "Storytellers",
      "colors": [const Color(0xffe74c3c), const Color(0xffe67e22)],
    },
    {
      "svgPath": "assets/svg/rangoli.svg",
      "title": "Rangoli\nArtists",
      "colors": [const Color(0xfff39c12), const Color(0xffd35400)],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(
                  controller: controller,
                  onBackPressed: () {},
                  text: "Our Artists"),
              SizedBox(height: 20.h),
              Wrap(
                spacing: 8.w,
                runSpacing: 10.h,
                children: artistsData.map((artist) {
                  return ArtistsContainer(
                    svgPath: artist["svgPath"],
                    title: artist["title"],
                    colors: artist["colors"],
                  );
                }).toList(),
              ),
              SizedBox(height: 20.h),
              Text(
                "More coming soon",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: const Color(0xffFFECCA), fontSize: 24.sp),
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.only(left: 14.0.w),
                child: Row(
                  children: [
                    Text(
                      "Moments\nWe Capture",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: const Color(0xffFFECCA), fontSize: 37.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35.0.h),
                      child: Icon(
                        Icons.favorite,
                        size: 32.sp,
                        color: const Color(0xff9A2143),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _currentIndex, onTap: _onTabTapped),
    );
  }
}
