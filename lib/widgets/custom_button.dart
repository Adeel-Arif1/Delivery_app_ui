import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

class CustomBottomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomBottomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only (left :8.0),
      child: SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor, // Red background
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Circular corners
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white, // White text
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
