import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartSection extends StatefulWidget {
  const ChartSection({super.key});

  @override
  _ChartSectionState createState() => _ChartSectionState();
}

class _ChartSectionState extends State<ChartSection> {
  String selectedTab = 'Month';
  final List<String> tabs = ['Week', 'Month', 'Year'];
  final List<PieChartSectionData> chartData = [
    PieChartSectionData(color: Color(0xFFF48FB1), value: 65, title: '65%', radius: 50),
    PieChartSectionData(color: Color(0xFFFFBA49), value: 15, title: '15%', radius: 50),
    PieChartSectionData(color: Color(0xFFAED581), value: 20, title: '20%', radius: 50),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: tabs.map((tab) => _buildTabButton(tab, screenWidth)).toList(),
          ),
          const SizedBox(height: 15),
          // Points Text
          Text(
            '2,160 points',
            style: TextStyle(
              fontSize: screenWidth * 0.05, // Responsive font size
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 15),
          // Chart and Categories
          Row(
            children: [
              // Pie Chart
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: screenHeight * 0.25, // Responsive height
                  child: PieChart(
                    PieChartData(
                      sections: chartData,
                      sectionsSpace: 2,
                      centerSpaceRadius: screenWidth * 0.1, // Responsive center space
                    ),
                  ),
                ),
              ),
              // Categories
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top Issues',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildCategory('Roads', chartData[0].color, screenWidth),
                    _buildCategory('Transports', chartData[1].color, screenWidth),
                    _buildCategory('Utilities', chartData[2].color, screenWidth),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildTabButton(String tabName, double screenWidth) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = tabName;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.02, // Responsive vertical padding
          horizontal: screenWidth * 0.05, // Responsive horizontal padding
        ),
        decoration: BoxDecoration(
          color: selectedTab == tabName ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Text(
          tabName,
          style: TextStyle(
            color: selectedTab == tabName ? Colors.white : Colors.black,
            fontSize: screenWidth * 0.035, // Responsive font size
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(String title, Color color, double screenWidth) {
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: screenWidth * 0.03), // Responsive icon size
        SizedBox(width: screenWidth * 0.02), // Responsive spacing
        Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * 0.04, // Responsive font size
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}