import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  String title;
  Label({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, bottom: 7),
      child: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
