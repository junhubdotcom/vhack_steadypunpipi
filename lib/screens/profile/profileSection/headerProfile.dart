import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20) ,bottomRight: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Text("Hi John", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
          Text("Account", style: TextStyle(color: Colors.white70,fontSize: 16),),
        ],),
    );
  }
}