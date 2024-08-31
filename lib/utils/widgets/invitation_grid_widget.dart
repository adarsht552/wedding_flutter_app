import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wedding/models/invitation_model.dart';
import 'package:wedding/screens/selected_invite.dart';

class InvitationGrid extends StatelessWidget {
  final List<InvitationModel> invitations;

  const InvitationGrid({super.key, required this.invitations});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(16.r),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.40,
        crossAxisSpacing: 12.w,
      ),
      itemBuilder: (context, index) {
        return InvitationCard(invitation: invitations[index]);
      },
      itemCount: invitations.length,
    );
  }
}

class InvitationCard extends StatelessWidget {
  final InvitationModel invitation;

  const InvitationCard({super.key, required this.invitation});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0.h, left: 2.w),
              child: SizedBox(
                height: 240.h,
                width: double.infinity,
                child: ClipPath(
                  clipper: MyClipper(),
                  child: Image.asset(
                    invitation.imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 255.h,
              width: double.infinity,
              child: SvgPicture.asset(
                'assets/svg/frame.svg',
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Wrap(
                spacing: 5,
                runSpacing: 5,
                alignment: WrapAlignment.center,
                children: invitation.chipLabels
                    .map((label) => ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: constraints.maxWidth / 2 - 10),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: const Color(0xffF6F2E7),
                              border:
                                  Border.all(color: const Color(0xffC7873C)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              label,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    fontSize: 10,
                                    color: const Color(0xffC7873C),
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ))
                    .toList(),
              );
            },
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          invitation.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '₹${invitation.price}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8.w),
            Text(
              '₹${invitation.originalPrice}',
              style: const TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SelectedInvite(invitation: invitation)));
            },
            style: ElevatedButton.styleFrom(
              side: const BorderSide(color: Colors.black),
              elevation: 0.0,
              minimumSize: Size(20.w, 20.h),
              backgroundColor: Colors.white,
            ),
            child: Text(
              'Select',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(77.3444, 234.373);
    path_0.cubicTo(77.2805, 234.415, 77.2229, 234.453, 77.1718, 234.488);
    path_0.cubicTo(77.1208, 234.453, 77.0632, 234.415, 76.9992, 234.373);
    path_0.cubicTo(76.6949, 234.173, 76.2453, 233.891, 75.6575, 233.557);
    path_0.cubicTo(74.4821, 232.89, 72.7531, 232.016, 70.5264, 231.181);
    path_0.cubicTo(66.0725, 229.511, 59.6256, 227.995, 51.6388, 228.601);
    path_0.cubicTo(43.7665, 229.198, 35.6456, 228.744, 29.3633, 226.309);
    path_0.cubicTo(23.1099, 223.886, 18.7185, 219.525, 18.1305, 212.265);
    path_0.cubicTo(17.8177, 208.402, 16.5084, 206.37, 14.6411, 205.131);
    path_0.cubicTo(13.73, 204.527, 12.7106, 204.129, 11.6768, 203.786);
    path_0.cubicTo(11.2787, 203.654, 10.8855, 203.532, 10.4935, 203.411);
    path_0.cubicTo(9.84254, 203.209, 9.19499, 203.009, 8.53412, 202.764);
    path_0.cubicTo(6.47132, 202.001, 4.49759, 200.88, 3.01764, 198.307);
    path_0.cubicTo(1.52248, 195.708, 0.5, 191.574, 0.5, 184.714);
    path_0.lineTo(0.5, 50.3831);
    path_0.cubicTo(0.5, 43.5236, 1.52248, 39.3892, 3.01764, 36.7902);
    path_0.cubicTo(4.49759, 34.2176, 6.47132, 33.0963, 8.53412, 32.3332);
    path_0.cubicTo(9.19501, 32.0887, 9.84258, 31.8882, 10.4936, 31.6865);
    path_0.cubicTo(10.8855, 31.5652, 11.2787, 31.4434, 11.6768, 31.3114);
    path_0.cubicTo(12.7106, 30.9687, 13.73, 30.5703, 14.6411, 29.9661);
    path_0.cubicTo(16.5084, 28.7277, 17.8177, 26.6951, 18.1305, 22.8329);
    path_0.cubicTo(18.7185, 15.5738, 23.1098, 11.2125, 29.3633, 8.78862);
    path_0.cubicTo(35.6456, 6.35356, 43.7665, 5.89903, 51.6388, 6.49668);
    path_0.cubicTo(59.6256, 7.1031, 66.0725, 5.58759, 70.5264, 3.91721);
    path_0.cubicTo(72.7531, 3.08211, 74.4822, 2.20814, 75.6576, 1.54075);
    path_0.cubicTo(76.2453, 1.20702, 76.6949, 0.924819, 76.9992, 0.724764);
    path_0.cubicTo(77.0632, 0.682708, 77.1208, 0.64428, 77.1719, 0.609763);
    path_0.cubicTo(77.223, 0.64428, 77.2805, 0.682708, 77.3445, 0.724764);
    path_0.cubicTo(77.6488, 0.924819, 78.0984, 1.20702, 78.6862, 1.54075);
    path_0.cubicTo(79.8616, 2.20814, 81.5906, 3.08211, 83.8173, 3.91721);
    path_0.cubicTo(88.2712, 5.58759, 94.7181, 7.1031, 102.705, 6.49668);
    path_0.cubicTo(110.579, 5.89903, 118.7, 6.35313, 124.982, 8.78796);
    path_0.cubicTo(131.235, 11.2116, 135.625, 15.5729, 136.213, 22.8329);
    path_0.cubicTo(136.527, 26.6952, 137.836, 28.7278, 139.703, 29.9661);
    path_0.cubicTo(140.615, 30.5703, 141.634, 30.9687, 142.668, 31.3114);
    path_0.cubicTo(143.066, 31.4434, 143.459, 31.5651, 143.851, 31.6865);
    path_0.cubicTo(144.502, 31.8881, 145.149, 32.0887, 145.81, 32.3332);
    path_0.cubicTo(147.873, 33.0963, 149.847, 34.2176, 151.326, 36.7902);
    path_0.cubicTo(152.821, 39.3892, 153.844, 43.5236, 153.844, 50.3831);
    path_0.lineTo(153.844, 184.714);
    path_0.cubicTo(153.844, 191.574, 152.821, 195.708, 151.327, 198.307);
    path_0.cubicTo(149.847, 200.88, 147.873, 202.001, 145.811, 202.764);
    path_0.cubicTo(145.15, 203.009, 144.502, 203.209, 143.851, 203.411);
    path_0.cubicTo(143.46, 203.532, 143.066, 203.654, 142.668, 203.786);
    path_0.cubicTo(141.635, 204.129, 140.615, 204.527, 139.704, 205.131);
    path_0.cubicTo(137.837, 206.37, 136.527, 208.402, 136.213, 212.264);
    path_0.lineTo(136.213, 212.265);
    path_0.cubicTo(135.625, 219.525, 131.235, 223.886, 124.982, 226.309);
    path_0.cubicTo(118.7, 228.744, 110.579, 229.198, 102.705, 228.601);
    path_0.cubicTo(94.7172, 227.995, 88.2703, 229.511, 83.8167, 231.181);
    path_0.cubicTo(81.5901, 232.016, 79.8612, 232.89, 78.6859, 233.557);
    path_0.cubicTo(78.0982, 233.891, 77.6487, 234.173, 77.3444, 234.373);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
