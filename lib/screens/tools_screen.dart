import 'package:flutter/material.dart';
import 'package:wedding/utils/widgets/gradient_container.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientContainer(
              svgPath: "assets/svg/invite_guest.svg",
              title: "INVITE GUESTS",
              subTitle: "DESIGNS, SENDS & TRACKS RSVPS",
            ),
          ],
        ),
      ),
    );
  }
}
