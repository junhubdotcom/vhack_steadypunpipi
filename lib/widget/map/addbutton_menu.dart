import 'package:flutter/material.dart';

class AddMenu extends StatelessWidget{
  const AddMenu({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          color: Colors.orange[100],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Icon(Icons.edit_document),
                SizedBox(width: 12),
                Text('Manual'),
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          color: Colors.red[100],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Icon(Icons.camera_alt_outlined),
                SizedBox(width: 12),
                Text('Camera'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}