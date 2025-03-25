import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/widget/reportList/button_row.dart';
import 'package:steadypunpipi_vhack/widget/reportList/status_badge.dart';
import 'package:steadypunpipi_vhack/widget/reportList/time_widget.dart';
import 'package:steadypunpipi_vhack/screens/reportList/report_detail.dart';
import 'package:steadypunpipi_vhack/models/report_data.dart';

class ReportItem extends StatelessWidget {
  final int index;
  final VoidCallback onUpvote;
  final VoidCallback onDownvote;

  ReportItem({
    required this.index,
    required this.onUpvote,
    required this.onDownvote,
  });

  @override
  Widget build(BuildContext context) {
    final report = Issues.getReportByIndex(index); 
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReportDetailPage(
              index: index,
              onUpvote: onUpvote, 
              onDownvote: onDownvote,
            ),
          ),
        );
      },
      child: Card(
        color: Color(0xFFFFFFFF),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.transparent),
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
                      report?['image'],
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
                          report?['title'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Row(
                          children: [
                            TimeWidget(time: report?['time']),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            if (report?['isIoTVerified']) ...[
                              StatusBadge(text: 'IoT Verified'),
                              SizedBox(width: 8),
                            ],
                            SizedBox(width: 8),
                            StatusBadge(text: report?['status']),
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
              ButtonRow(
                index: index,
                status: report?['status'],
                onUpvote: onUpvote,
                onDownvote: onDownvote,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
