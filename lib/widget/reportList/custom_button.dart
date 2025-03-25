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
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        backgroundColor: isPressed ? Colors.black.withOpacity(0.5) : color, 
        foregroundColor: Colors.black,
        elevation: 0, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        minimumSize: const Size(0, 32),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isPressed ? Colors.white : Colors.black, size: 22),
          const SizedBox(width: 8),
          Text(text, style: TextStyle(color: isPressed ? Colors.white : Colors.black),),
        ],
      ),
    );
  }
}
