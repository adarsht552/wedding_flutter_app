import 'package:flutter/material.dart';
import 'package:wedding/utils/widgets/header_widget.dart';

class ArtistsScreen extends StatelessWidget {
  ArtistsScreen({super.key});

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderWidget(
                controller: controller,
                onBackPressed: () {},
                text: "Our Artists"),
          ],
        ),
      ),
    );
  }
}
