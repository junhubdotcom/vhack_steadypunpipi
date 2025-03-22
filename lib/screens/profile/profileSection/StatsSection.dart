import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/models/SummaryModel.dart';

class StatsSection extends StatelessWidget {
  static final SummaryModel summaryData = 
    SummaryModel(
      totalReports: '200', 
      contribution: '55', 
      resolvedReports: '145', 
      rewardsPoints: '4000', 
      pendingReports: '20',
    );
  @override
  Widget build(BuildContext context){
    return Padding(padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StatCard(title: "TOTAL REPORTS", iconData: Icons.trending_up_rounded,value: summaryData.totalReports),
            StatCard(title: "CONTRIBUTION", iconData: Icons.trending_down_rounded,value: summaryData.contribution),
            StatCard(title: "RESOLVED", iconData: Icons.trending_up_rounded,value: summaryData.resolvedReports),
          ],),
          SizedBox(height: 16),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               _buildSummaryCard(title: "REWARDS", iconData: Icons.monetization_on_rounded,value: summaryData.rewardsPoints, unit: "points",containerColor: Colors.blue.shade400,titleColor: const Color(0xFFF2F2DF),valueColor: Colors.white),
               _buildSummaryCard(title: "PENDING", iconData: Icons.list,value: summaryData.pendingReports),
            ],
          ),
      ],
    ),);
  }
    _buildSummaryCard({required String title, required IconData iconData, required String value, String? unit,Color? containerColor, Color? titleColor, Color? valueColor}) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: containerColor??Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: titleColor??Color(0xFFBDBBBB))),
              SizedBox(width: 20),
              Icon(iconData, color: titleColor??Color(0xFFBDBBBB))
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(value, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600,color: valueColor??Colors.black)),
              SizedBox(width: 2),
              if (unit != null) Text(unit, style: TextStyle(fontSize:17,color: valueColor ?? Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget{
  final String title;
  final IconData iconData;
  final String value;
  StatCard({required this.title, required this.iconData, required this.value});

  @override
  Widget build(BuildContext context){
    Color iconColor;
    Color backgroundColor;

    if(iconData == Icons.trending_up_rounded){
      iconColor = Color(0xFF2E8C52);
      backgroundColor = Color(0xFFCCF59D);
    }else if(iconData == Icons.trending_down_rounded){
      iconColor = Color(0xFFD79130);
      backgroundColor = Color(0xFFFFDDAE);
    }else{
      iconColor = Colors.grey;
      backgroundColor = Colors.transparent;
    }

    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold),),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(iconData,size: 15,color: iconColor),
            ),
            SizedBox(width: 5),
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ],
        ),
      ],
    );
  }
}