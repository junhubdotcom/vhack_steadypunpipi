import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/widget/reportList/button_row.dart';
import 'package:steadypunpipi_vhack/widget/reportList/status_badge.dart';
import 'package:steadypunpipi_vhack/models/report_data.dart';

class ReportDetailPage extends StatelessWidget {
  final int index;
  final VoidCallback onUpvote;
  final VoidCallback onDownvote;

  const ReportDetailPage({
    required this.index,
    required this.onUpvote,
    required this.onDownvote,
  });

  @override
  Widget build(BuildContext context) {
    final report = Issues.getReportByIndex(index); // Fetch report data dynamically

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
                Image.asset(report?['image']), // Use dynamic image
                SizedBox(height: 16),
                Text(
                  report?['title'], // Use dynamic title
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  report?['time'], // Use dynamic time
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    if (report?['isIoTVerified']) ...[ // Use dynamic isIoTVerified
                      StatusBadge(text: 'IoT Verified'),
                      SizedBox(width: 8),
                    ],
                    SizedBox(width: 8),
                    StatusBadge(text: report?['status']), // Use dynamic status
                  ],
                ),
                SizedBox(height: 16),
                Text("Report No.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text(
                  report?['reportNo'], 
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
                  report?['issueType'], 
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
                  report?['description'],
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
                    report?['address'], // Use dynamic location
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
                        color: _getUrgencyColor(report?['urgencyLevel']),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      report?['urgencyLevel'] ?? "Unknown",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
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
                        color: _getSeverityColor(report?['severityLevel']),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      report?['severityLevel'] ?? "Unknown",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
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
        child: ButtonRow(
          index: index,
          status: report?["status"],
          onUpvote: onUpvote,
          onDownvote: onDownvote,
        ),
      ),
    );
  }

  Color _getUrgencyColor(String? urgencyLevel) {
    switch (urgencyLevel?.toLowerCase()) {
      case 'low':
        return Colors.green;
      case 'medium':
        return Colors.orange;
      case 'high':
        return Colors.red;
      default:
        return Colors.grey; // Default color for unknown levels
    }
  }

  Color _getSeverityColor(String? severityLevel) {
    switch (severityLevel?.toLowerCase()) {
      case 'low':
        return Colors.green;
      case 'moderate':
        return Colors.orange;
      case 'severe':
        return Colors.red;
      default:
        return Colors.grey; // Default color for unknown levels
    }
  }
}
