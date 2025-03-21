import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/widget/reportList/buttonRow.dart';
import 'package:steadypunpipi_vhack/widget/reportList/statusBadge.dart';
import 'package:steadypunpipi_vhack/widget/reportList/timeWidget.dart';
import 'package:steadypunpipi_vhack/widget/reportList/buttonRow.dart';  

class ReportItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/roadhole1.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Road Hole Detected - Jalan Bukit Bintang, Kuala Lumpur',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Row(
                        children: [
                          TimeWidget(time: '10:45 AM, March 18, 2025'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          StatusBadge(text: 'IoT Verified', color: Colors.red),
                          SizedBox(width: 8),
                          StatusBadge(text: 'In Progress', color: Colors.blue),
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 12),
            ButtonRow(),
          ],
        ),
      ),
    );
  }
}
