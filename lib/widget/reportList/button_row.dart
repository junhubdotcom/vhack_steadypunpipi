
import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/widget/reportList/custom_button.dart';
import 'package:steadypunpipi_vhack/models/report_data.dart';
import 'package:steadypunpipi_vhack/widget/reportList/upvote_button.dart';

class ButtonRow extends StatefulWidget {
  final int index;
  final String status;
  final VoidCallback onUpvote;
  final VoidCallback onDownvote;

  const ButtonRow({
    required this.index,
    required this.status,
    required this.onUpvote,
    required this.onDownvote,
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonRow> createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  @override
  Widget build(BuildContext context) {
    final report = Issues.getReportByIndex(widget.index);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        VoteButton(
          initialVotes: report?['count'],
          onUpvote: widget.onUpvote,
          onDownvote: widget.onDownvote,
        ),
        SizedBox(width: 4),
        CustomButton(
            key: ValueKey('share_button'),
            icon: Icons.share,
            text: "Share",
            color: Color(0xFFDEE4E7),
            isPressed: false,
            onPressed: () {}),
        SizedBox(width: 4),
        report?['status'].toString().trim().toLowerCase() == "resolved"
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
