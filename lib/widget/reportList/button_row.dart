import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/widget/reportList/custom_button.dart';

class ButtonRow extends StatelessWidget {
  final String status;

  const ButtonRow({required this.status});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButton(
            key: ValueKey('upvote_button'),
            icon: Icons.arrow_upward,
            text: "400",
            color: Color(0xFFDEE4E7),
            isPressed: false,
            onPressed: () {}),
        SizedBox(width: 4),
        CustomButton(
            key: ValueKey('downvote_button'),
            icon: Icons.arrow_downward,
            text: "10",
            color: Color(0xFFDEE4E7),
            isPressed: false,
            onPressed: () {}),
        SizedBox(width: 4),
        CustomButton(
            key: ValueKey('share_button'),
            icon: Icons.share,
            text: "Share",
            color: Color(0xFFDEE4E7),
            isPressed: false,
            onPressed: () {}),
        SizedBox(width: 4),
        status == 'Resolved'
            ? CustomButton(
                key: ValueKey('reraise_button'),
                icon: Icons.waving_hand,
                text: "Reraise",
                color: Color(0xFFDEE4E7),
                isPressed: false,
                onPressed: () {})
            : CustomButton(
                key: ValueKey('contribute_button'),
                icon: Icons.handshake,
                text: "Contribute",
                color: Color(0xFFDEE4E7),
                isPressed: false,
                onPressed: () {}),
      ],
    );
  }
}
