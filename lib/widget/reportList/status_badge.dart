import 'package:flutter/material.dart';

class StatusBadge extends StatefulWidget {
  final String text;
  final String statusFilter;

  const StatusBadge({required this.text, this.statusFilter = ''}); // Assign default value

  @override
  State<StatusBadge> createState() => _StatusBadgeState();
}

class _StatusBadgeState extends State<StatusBadge> {
  Color getColor(String status) {
    switch (status) {
      case 'IoT Verified':
        return Colors.red;
      case 'In Progress':
        return Colors.blue;
      case 'Resolved':
        return Colors.green;
      case 'Under Review':
        return Colors.orange;
      case 'Reported':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = getColor(widget.text);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        widget.text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
