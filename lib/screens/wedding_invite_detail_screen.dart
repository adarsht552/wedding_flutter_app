import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedding/models/invitation_model.dart';
import 'package:wedding/utils/widgets/chip_list_view.dart';
import 'package:wedding/utils/widgets/header_widget.dart';
import 'package:wedding/utils/widgets/invitation_grid_widget.dart';

class WeddingInviteDetailScreen extends StatelessWidget {
  const WeddingInviteDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(
                  controller: controller,
                  onBackPressed: () {},
                  text: "Wedding\nInvite"),
              const ChipListView(),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 30.0.w),
                  child: Text(
                    "New Arrival",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              SvgPicture.asset('assets/svg/curve_line.svg'),
              InvitationGrid(invitations: invitations)
            ],
          ),
        ),
      ),
    );
  }
}
