import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  ReservationScreenState createState() => ReservationScreenState();
}

class ReservationScreenState extends State<ReservationScreen> {
  DateTime selectedDate = DateTime.now();
  String selectedTime = '10:00 AM';
  List<String> times = [
    '09.00 AM',
    '09.30 AM',
    '10.00 AM',
    '10.30 AM',
    '11.00 AM',
    '11.30 AM',
    '03.00 PM',
    '03.30 PM',
    '04.00 PM',
    '04.30 PM',
    '05.00 PM',
    '05.30 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Book',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Date',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15.h),
            Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Color(0xffDF005E),
                ),
                textTheme: const TextTheme(
                  displayMedium: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                padding: EdgeInsets.all(8.r),
                child: CalendarDatePicker(
                  initialDate: selectedDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                  onDateChanged: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Select Hour',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15.h),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: times.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.5,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTime = times[index];
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedTime == times[index]
                          ? const Color(0xffDF005E)
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      times[index],
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: selectedTime == times[index]
                                    ? Colors.white
                                    : Colors.black54,
                              ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10.h),
            const Divider(color: Colors.black12),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              height: 70.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18.r),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Rs 2450",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                color: Colors.black),
                      ),
                      Text(
                        'for 6 hrs',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 14.sp, color: Colors.black54),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      backgroundColor: const Color(0xffDF005E),
                    ),
                    child: Text(
                      "Continue",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
