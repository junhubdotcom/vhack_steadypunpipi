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
    PieChartSectionData(color: Color(0xFF819B63), value: 20, title: '20%', radius: 50),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: tabs.map((tab) => _buildTabButton(tab)).toList(),
          ),
          const SizedBox(height: 10),
          const Text(
            '2,160 points',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 2,
                child:SizedBox(
                  height: 200,
                  child: PieChart(
                    PieChartData(
                      sections: chartData,
                      sectionsSpace: 2,
                      centerSpaceRadius: 50,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Top Issues',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                      const SizedBox(height: 10),
                      _buildCategory('Roads', chartData[0].color),
                      _buildCategory('Transports', chartData[1].color),
                      _buildCategory('Utilities', chartData[2].color),
                    ],
                  ),),
            ],
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildTabButton(String tabName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = tabName;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          color: selectedTab == tabName ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Text(
          tabName,
          style: TextStyle(
            color: selectedTab == tabName ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(String title, Color color) {
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 12),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}
