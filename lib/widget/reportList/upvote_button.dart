import 'package:flutter/material.dart';

class VoteButton extends StatefulWidget {
  final int initialVotes;
  final VoidCallback onUpvote;
  final VoidCallback onDownvote;

  const VoteButton(
      {Key? key,
      this.initialVotes = 0,
      required this.onUpvote,
      required this.onDownvote})
      : super(key: key);

  @override
  _VoteButtonState createState() => _VoteButtonState();
}

class _VoteButtonState extends State<VoteButton> {
  int votes = 0;
  bool isUpvoted = false;
  bool isDownvoted = false;

  @override
  void initState() {
    super.initState();
    votes = widget.initialVotes;
  }

  void _toggleUpvote() {
    setState(() {
      if (isUpvoted) {
        isUpvoted = false;
        votes--;
        widget.onDownvote();
      } else {
        if (isDownvoted) {
          isDownvoted = false;
          votes++;
        }
        isUpvoted = true;
        votes++;
        widget.onUpvote();
      }
    });
  }

  void _toggleDownvote() {
    setState(() {
      if (isDownvoted) {
        isDownvoted = false;
        votes++;
        widget.onUpvote();
      } else {
        if (isUpvoted) {
          isUpvoted = false;
          votes--;
        }
        isDownvoted = true;
        votes--;
        widget.onDownvote();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        color: Color(0xFFDEE4E7),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_upward,
                color: isUpvoted ? Colors.green : Colors.black),
            onPressed: _toggleUpvote,
          ),
          Text("$votes",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              )),
          IconButton(
            icon: Icon(Icons.arrow_downward,
                color: isDownvoted ? Colors.red : Colors.black),
            onPressed: _toggleDownvote,
          ),
        ],
      ),
    );
  }
}
