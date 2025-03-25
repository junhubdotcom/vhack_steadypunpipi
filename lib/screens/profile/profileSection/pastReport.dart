import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/models/report_data.dart';

class PastReportsSection extends StatelessWidget {
  final List<Map<String, dynamic>> pastReportData = Issues.getAllReports().take(5).toList();

  PastReportsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Past report", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ListView.builder(
            padding: EdgeInsets.only(top: 5),
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
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Icon(_getIcon(report['issueType']), color: _getUrgencyColor(report['urgencyLevel'])),
        title: Text(report['issueType']),
        subtitle: Text(report['address']),
        trailing: Text(report['time']),
      ),
    );
  }
}