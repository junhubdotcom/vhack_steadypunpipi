import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/widget/reportList/button_row.dart';
import 'package:steadypunpipi_vhack/widget/reportList/status_badge.dart';

class ReportDetailPage extends StatelessWidget {
  final String image;
  final String title;
  final String time;
  final String status;
  final bool isIoTVerified;

  const ReportDetailPage({
    required this.image,
    required this.title,
    required this.time,
    required this.status,
    required this.isIoTVerified,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Report Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(image),
                SizedBox(height: 16),
                Text(
                  title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  time,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    if (isIoTVerified) ...[
                      StatusBadge(text: 'IoT Verified'),
                      SizedBox(width: 8),
                    ],
                    SizedBox(width: 8),
                    StatusBadge(text: status),
                  ],
                ),
                SizedBox(height: 16),
                Text("Report No.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text(
                  "CBA1234567890",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Divider(indent: 4, endIndent: 4),
                ),
                Text("Issue Type",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text(
                  "Pothole",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Divider(indent: 4, endIndent: 4),
                ),
                Text("Description",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text(
                  '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Divider(indent: 4, endIndent: 4),
                ),
                Text("Location",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text(
                    "Universiti Putra Malaysia, Kolej Canselor, 43400 Seri Kembangan, Selangor (2.995411,101.710011)",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Divider(indent: 4, endIndent: 4),
                ),
                Text("Urgency Level",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text("High",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Divider(indent: 4, endIndent: 4),
                ),
                Text("Severity Level",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text("Critical",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white, // Optional: Add background color to the button row
        padding: const EdgeInsets.all(16.0),
        child: ButtonRow(status: status),
      ),
    );
  }
}
