import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final bool isPressed;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key, // Added Key for better widget management
    required this.icon,
    required this.text,
    required this.color,
    required this.isPressed,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03, // Responsive horizontal padding
          vertical: screenWidth * 0.02, // Responsive vertical padding
        ),
        backgroundColor: isPressed ? Colors.black.withOpacity(0.5) : color,
        foregroundColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.05), // Responsive border radius
        ),
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: screenWidth * 0.035, // Responsive font size
        ),
        minimumSize: Size(0, screenWidth * 0.08), // Responsive minimum size
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isPressed ? Colors.white : Colors.black, size: screenWidth * 0.05), // Responsive icon size
          SizedBox(width: screenWidth * 0.02), // Responsive spacing
          Text(
            text,
            style: TextStyle(color: isPressed ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
