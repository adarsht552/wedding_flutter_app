import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding/models/invitation_model.dart';

class SelectedInvite extends StatelessWidget {
  final InvitationModel invitation;
  const SelectedInvite({super.key, required this.invitation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.r),
                  bottomRight: Radius.circular(32.r),
                ),
                child: Image.asset(
                  invitation.imagePath,
                  height: 550.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Text(invitation.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 28.sp)),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('₹${invitation.price}',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: 22.sp)),
                  SizedBox(width: 14.w),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 18,
                  ),
                  Text(invitation.rating,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: 22.sp))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                child: const Divider(),
              ),
              Text(
                'Description',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
              SizedBox(height: 5.h),
              Text(
                invitation.description,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: 16.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0.h),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.h),
                    backgroundColor: const Color(0xffD7AB5D),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Select",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.white, fontSize: 22.sp),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
