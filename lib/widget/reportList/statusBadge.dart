import 'package:flutter/material.dart';

class StatusBadge extends StatefulWidget {
  final String text;
  final Color color;

  const StatusBadge({required this.text, required this.color});

  @override
  State<StatusBadge> createState() => _StatusBadgeState();
}

class _StatusBadgeState extends State<StatusBadge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: widget.color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        widget.text,
        style: TextStyle(color: widget.color, fontWeight: FontWeight.bold),
      ),
    );
  }
}