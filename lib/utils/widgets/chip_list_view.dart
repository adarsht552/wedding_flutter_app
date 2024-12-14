import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChipListView extends StatefulWidget {
  const ChipListView({super.key});

  @override
  ChipListViewState createState() => ChipListViewState();
}

class ChipListViewState extends State<ChipListView> {
  final List<bool> _isSelected = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 40.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _buildChip("Filter", 'assets/svg/filter.svg', 0),
            _buildChip("Rating 4.5+", 'assets/svg/star.svg', 1),
            _buildChip("Price", 'assets/svg/rupee.svg', 2),
            _buildChip("Bestseller", 'assets/svg/bestseller.svg', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String title, String svgPath, int index) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0.w),
      child: RawChip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        side: BorderSide(
          color:
              _isSelected[index] ? const Color(0xffE9AB26) : Colors.transparent,
          width: 1.0,
        ),
        backgroundColor: const Color(0xffF6F2E7),
        selectedColor: const Color(0xffF6F2E7),
        avatar: SvgPicture.asset(
          svgPath,
          height: 20.h,
          width: 20.w,
        ),
        label: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        selected: _isSelected[index],
        onSelected: (bool selected) {
          setState(() {
            _isSelected[index] = selected;
          });
        },
        showCheckmark: false,
      ),
    );
  }
}
