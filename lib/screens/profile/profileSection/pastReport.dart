import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/models/report_data.dart';

class PastReportsSection extends StatelessWidget {
  final List<Map<String, dynamic>> pastReportData = Issues.getAllReports().take(5).toList();

  PastReportsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Past report",
            style: TextStyle(
              fontSize: screenWidth * 0.045, // Responsive font size
              fontWeight: FontWeight.bold,
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.only(top: screenWidth * 0.02),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: pastReportData.length,
            itemBuilder: (context, index) => PastReportCard(report: pastReportData[index]),
          ),
        ],
      ),
    );
  }
}

class PastReportCard extends StatelessWidget {
  final Map<String, dynamic> report;
  PastReportCard({required this.report});

  IconData _getIcon(String issueType) {
    switch (issueType.toLowerCase()) {
      case 'pothole':
        return Icons.directions_car;
      case 'fallen tree':
        return Icons.nature_people;
      case 'broken streetlight':
        return Icons.lightbulb;
      case 'blocked drain':
        return Icons.water_damage;
      default:
        return Icons.warning;
    }
  }

  Color _getUrgencyColor(String urgencyLevel) {
    switch (urgencyLevel.toLowerCase()) {
      case 'low':
        return Colors.green;
      case 'medium':
        return Colors.orange;
      case 'high':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
    color: Colors.white,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Leading Icon
          Icon(
            _getIcon(report['issueType']),
            color: _getUrgencyColor(report['urgencyLevel']),
            size: screenWidth * 0.08, // Responsive icon size
          ),
          SizedBox(width: 12), // Space between icon and text
          // Title and Address
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  report['issueType'],
                  style: TextStyle(
                    fontSize: screenWidth * 0.04, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  report['address'],
                  style: TextStyle(
                    fontSize: screenWidth * 0.035, // Responsive font size
                    color: Colors.grey[700],
                  ),
                  maxLines: 2, // Allow up to 2 lines for the address
                  overflow: TextOverflow.ellipsis, // Truncate with ellipsis if too long
                ),
              ],
            ),
          ),
          SizedBox(width: 12), // Space between text and trailing
          // Trailing Time
          Flexible(
            child: Text(
              report['time'],
              style: TextStyle(
                fontSize: screenWidth * 0.035, // Responsive font size
                color: Colors.grey[600],
              ),
              maxLines: 1, // Ensure time stays on a single line
              overflow: TextOverflow.ellipsis, // Truncate with ellipsis if too long
              textAlign: TextAlign.right, // Align text to the right
            ),
          ),
        ],
      ),
    ),
  );
  }
}