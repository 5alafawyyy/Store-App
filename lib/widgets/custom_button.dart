import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  const CustomButon({
    super.key,
    this.onTap,
    required this.text,
    required this.buttonBackgroundColor,
    required this.buttonTextColor,
  });

  final VoidCallback? onTap;
  final String text;
  final Color buttonBackgroundColor;
  final Color buttonTextColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: buttonBackgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: buttonTextColor),
          ),
        ),
      ),
    );
  }
}
