import 'package:flutter/material.dart';

class PastReportsSection extends StatelessWidget {
  //ltr change to connect with reportData
  List<Map<String, dynamic>> pastReportData = [
      {
      "title": "Roads - High urgency",
      "subtitle": "No. 1/4, Seri Kembangan",
      "date": "2025-03-18",
      "icon": "warning",
      "iconColor": "red"
    },
    {
      "title": "Fallen Tree - Medium",
      "subtitle": "Jalan Merdeka 5",
      "date": "2025-03-15",
      "icon": "nature_people",
      "iconColor": "orange"
    },
    {
      "title": "Pothole - Low",
      "subtitle": "Taman Jaya",
      "date": "2025-03-10",
      "icon": "directions_car",
      "iconColor": "blue"
    }
  ];

  PastReportsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Past report", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ListView.builder(
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

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'warning':
        return Icons.warning;
      case 'nature_people':
        return Icons.nature_people;
      case 'directions_car':
        return Icons.directions_car;
      default:
        return Icons.error;
    }
  }

  Color _getColor(String colorName) {
    switch (colorName) {
      case 'red':
        return Colors.red;
      case 'orange':
        return Colors.orange;
      case 'blue':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
    String _formatDate(DateTime date) {
    List<String> months = [
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];
    return "${months[date.month - 1]} ${date.day}, ${date.year}";
  }

  @override
  Widget build(BuildContext context) {
  DateTime date = DateTime.parse(report['date']);
  String formattedDate = _formatDate(date);
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Icon(_getIcon(report['icon']), color: _getColor(report['iconColor']),),
        title: Text(report['title']),
        subtitle: Text(report['subtitle']),
        trailing: Text(formattedDate),),);
  }
}