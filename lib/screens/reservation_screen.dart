import 'package:flutter/material.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Book"),
        backgroundColor: Colors.transparent,
      ),
      body: Center(child: Text("Reservation")),
    );
  }
}
