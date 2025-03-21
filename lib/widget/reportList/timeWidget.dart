import 'package:flutter/material.dart';

class TimeWidget extends StatefulWidget {
  final String time;
  const TimeWidget({required this.time});

  @override
  State<TimeWidget> createState() => _TimewidgetState();
}

class _TimewidgetState extends State<TimeWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.time,
      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
    );
  }
}