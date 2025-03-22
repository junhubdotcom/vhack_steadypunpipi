import 'package:flutter/material.dart';

class StartMenu extends StatelessWidget{
  const StartMenu({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          color: Colors.lightBlue[100],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Icon(Icons.directions_walk_rounded),
                SizedBox(width: 12),
                Text('Walking'),
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          color: Colors.deepPurple[100],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Icon(Icons.drive_eta_rounded),
                SizedBox(width: 12),
                Text('Driving'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}