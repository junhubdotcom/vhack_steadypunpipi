import 'package:flutter/material.dart';

class FillBox extends StatelessWidget {
  TextEditingController textEditingController;
  Widget? trailing;
  FillBox(
      {required this.textEditingController, this.trailing, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Color(0xffd9d9d9),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          suffixIcon: trailing),
    );
  }
}
