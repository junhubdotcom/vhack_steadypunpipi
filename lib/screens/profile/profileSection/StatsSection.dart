import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/models/SummaryModel.dart';

class StatsSection extends StatelessWidget {
  static final SummaryModel summaryData = SummaryModel(
    totalReports: '200',
    contribution: '55',
    resolvedReports: '145',
    rewardsPoints: '4000',
    pendingReports: '20',
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.02), // Responsive padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.03), // Responsive padding
          child: Column(
            children: [
              // First Row of Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatCard(
                    title: "TOTAL REPORTS",
                    iconData: Icons.trending_up_rounded,
                    value: summaryData.totalReports,
                    screenWidth: screenWidth,
                  ),
                  StatCard(
                    title: "CONTRIBUTION",
                    iconData: Icons.trending_down_rounded,
                    value: summaryData.contribution,
                    screenWidth: screenWidth,
                  ),
                  StatCard(
                    title: "RESOLVED",
                    iconData: Icons.trending_up_rounded,
                    value: summaryData.resolvedReports,
                    screenWidth: screenWidth,
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.04), // Responsive spacing
              // Second Row of Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSummaryCard(
                    title: "REWARDS",
                    iconData: Icons.monetization_on_rounded,
                    value: summaryData.rewardsPoints,
                    unit: "points",
                    containerColor: Colors.blue.shade400,
                    titleColor: const Color(0xFFF2F2DF),
                    valueColor: Colors.white,
                    screenWidth: screenWidth,
                  ),
                  _buildSummaryCard(
                    title: "PENDING",
                    iconData: Icons.list,
                    value: summaryData.pendingReports,
                    screenWidth: screenWidth,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required IconData iconData,
    required String value,
    String? unit,
    Color? containerColor,
    Color? titleColor,
    Color? valueColor,
    required double screenWidth,
  }) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.03), // Responsive padding
      decoration: BoxDecoration(
        color: containerColor ?? const Color(0xFFEAEAEA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.04, // Responsive font size
                  color: titleColor ?? const Color(0xFF979797),
                ),
              ),
              SizedBox(width: screenWidth * 0.02), // Responsive spacing
              Icon(
                iconData,
                color: titleColor ?? const Color(0xFF979797),
                size: screenWidth * 0.05, // Responsive icon size
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.02), // Responsive spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: screenWidth * 0.05, // Responsive font size
                  fontWeight: FontWeight.w600,
                  color: valueColor ?? Colors.black,
                ),
              ),
              if (unit != null)
                Text(
                  " $unit",
                  style: TextStyle(
                    fontSize: screenWidth * 0.04, // Responsive font size
                    color: valueColor ?? Colors.black,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String value;
  final double screenWidth;

  const StatCard({
    required this.title,
    required this.iconData,
    required this.value,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    Color iconColor;
    Color backgroundColor;

    if (iconData == Icons.trending_up_rounded) {
      iconColor = const Color(0xFF2E8C52);
      backgroundColor = const Color(0xFFCCF59D);
    } else if (iconData == Icons.trending_down_rounded) {
      iconColor = const Color(0xFFD79130);
      backgroundColor = const Color(0xFFFFDDAE);
    } else {
      iconColor = Colors.grey;
      backgroundColor = Colors.transparent;
    }

    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * 0.035, // Responsive font size
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenWidth * 0.02), // Responsive spacing
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth * 0.01), // Responsive padding
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(
                iconData,
                size: screenWidth * 0.04, // Responsive icon size
                color: iconColor,
              ),
            ),
            SizedBox(width: screenWidth * 0.02), // Responsive spacing
            Text(
              value,
              style: TextStyle(
                fontSize: screenWidth * 0.05, // Responsive font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}