import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  String title;
  Label({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 16),
    );
  }
}
