import 'package:flutter/material.dart';

class SummaryModel{
  final String totalReports;
  final String contribution;
  final String resolvedReports;
  final String rewardsPoints;
  final String pendingReports;

  SummaryModel({
    required this.totalReports,
    required this.contribution,
    required this.resolvedReports,
    required this.rewardsPoints,
    required this.pendingReports,
  });
}

// class Summary {
//   static final SummaryModel summaryData = 
//     SummaryModel(
//       totalReports: '200', 
//       contribution: '55', 
//       resolvedReports: '145', 
//       rewardsPoints: '4000', 
//       pendingReports: '20',
//     );
// }
