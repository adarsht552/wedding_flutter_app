import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String name;
  final Color? color;
  final VoidCallback? onPressed;
  final String imagePath;
  final Widget? child;

  const Buttons({
    super.key,
    required this.name,
    this.color = Colors.blue, // Default color if none is provided
    this.onPressed,
    required this.imagePath,
    this.child, // Add child widget
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(50),
        color: color,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            child: child ?? // Use the child widget if provided, else default layout
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(imagePath, width: 24, height: 24),
                    const SizedBox(width: 12),
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
