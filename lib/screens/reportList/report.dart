import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/widget/reportList/reportItem.dart';
 
 class ReportPage extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text("Road Hole Reports")),
      body: ListView.builder(
        itemCount: 5, // Replace with dynamic list length
        itemBuilder: (context, index) {
          return ReportItem(); // Generate multiple reports
        },
      ),
    );
   }
 }