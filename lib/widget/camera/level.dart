import 'package:flutter/material.dart';

class Level extends StatelessWidget {
  String levelText;
  Level({required this.levelText, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
      child: Row(children: [
        CircleAvatar(
            backgroundColor: levelText == "High"
                ? Colors.red
                : levelText == "Medium"
                    ? Colors.yellow
                    : Colors.green,
            radius: 8),
        SizedBox(
          width: 10,
        ),
        Text(
          levelText,
          style: TextStyle(fontSize: 16),
        ),
      ]),
    );
  }
}
