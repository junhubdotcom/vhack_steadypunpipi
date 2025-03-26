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
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(// Responsive width
      height: screenWidth * 0.1, // Responsive height
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01), // Responsive padding
      decoration: BoxDecoration(
        color: Color(0xFFDEE4E7),
        borderRadius: BorderRadius.circular(screenWidth * 0.08), // Responsive border radius
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_upward,
                color: isUpvoted ? Colors.green : Colors.black,
                size: screenWidth * 0.04), // Responsive icon size
            onPressed: _toggleUpvote,
          ),
          Text(
            "$votes",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.035, // Responsive font size
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_downward,
                color: isDownvoted ? Colors.red : Colors.black,
                size: screenWidth * 0.04), // Responsive icon size
            onPressed: _toggleDownvote,
          ),
        ],
      ),
    );
  }
}
