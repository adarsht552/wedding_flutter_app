import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wedding/models/photoartists_item.dart';

class StaggeredGridViewWidget extends StatelessWidget {
  final List<GridItemModel> items;

  const StaggeredGridViewWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GridItemWidget(item: items[index], index: index);
      },
    );
  }
}

class GridItemWidget extends StatelessWidget {
  final GridItemModel item;
  final int index;

  const GridItemWidget({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0.h, horizontal: 5.0.w),
      child: Container(
        height: 250 + (index % 2 * 50), // Staggered height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
            image: AssetImage(item.imageUrl),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.black.withOpacity(0.8), Colors.transparent],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (item.verified)
                      Padding(
                        padding: EdgeInsets.only(left: 4.0.w),
                        child: Icon(
                          Icons.verified,
                          color: Colors.white,
                          size: 20.r,
                        ),
                      ),
                  ],
                ),
                Text(
                  item.subtitle,
                  style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: List.generate(
                    5,
                    (starIndex) => Icon(
                      Icons.star,
                      color:
                          starIndex < item.rating ? Colors.amber : Colors.grey,
                      size: 20.r,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Wrap(
                  spacing: 4,
                  children: item.chips
                      .map(
                        (chip) => Container(
                          height: 23,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(12.r),
                              right: Radius.circular(12.r),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              chip,
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
