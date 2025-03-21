import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
            child: Row(
              children: [
                Icon(Icons.arrow_upward),
                Text('400'),
              ],
            ), 
          ),
          SizedBox(width: 4),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
            child: Row(
              children: [
                Icon(Icons.arrow_downward),
                Text('10'),
              ],
            ), 
          ),
          SizedBox(width: 4),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
            child: Row(
              children: [
                Icon(Icons.share),
                Text('Share'),
              ],
            ), 
          ),
          SizedBox(width: 4),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
            child: Row(
              children: [
                Icon(Icons.handshake),
                Text('Contribute'),
              ],
            ), 
          ),
        ],
      );
  }
}
