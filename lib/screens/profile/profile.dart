import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/screens/profile/reward.dart';

import 'chartSection.dart';
 
 void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tab Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProfilePage(),
    );
  }
}
 class ProfilePage extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
       body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30), 
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 2, blurRadius: 5, offset: Offset(0, 3))]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    StatsSection(),
                    RewardsSection(),
                  ],
                ),
              ),
            ),
            ChartSection(),
            PastReportsSection(),
            MyRewardsSection(),
          ],
       )),
     );
   }
 }

class HeaderSection extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20) ,bottomRight: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Text("Hi John", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
          Text("Account", style: TextStyle(color: Colors.white70,fontSize: 16),),
        ],),
    );
  }
}

class StatsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Padding(padding: const EdgeInsets.all(16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StatCard(title: "TOTAL REPORTS", iconData: Icons.trending_up_rounded,value: "200"),
        StatCard(title: "CONTRIBUTION", iconData: Icons.trending_down_rounded,value: "55"),
        StatCard(title: "RESOLVED", iconData: Icons.trending_up_rounded,value: "145"),
      ],),);
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

class RewardsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSummaryCard(title: "REWARDS", iconData: Icons.monetization_on_rounded,value: "4000", unit: "points",containerColor: Colors.blue.shade400,titleColor: const Color.fromARGB(255, 242, 242, 223),valueColor: Colors.white),
          _buildSummaryCard(title: "PENDING", iconData: Icons.list,value: "20"),
        ],
      ),
    );
  }
  
  _buildSummaryCard({required String title, required IconData iconData, required String value, String? unit,Color? containerColor, Color? titleColor, Color? valueColor}) {
    
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: containerColor??Color(0xFFF9F9F9),
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

class PastReportsSection extends StatelessWidget {
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
            itemCount: 3,
            itemBuilder: (context, index) => ReportCard(),
          ),
        ],
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Icon(Icons.warning, color: Colors.red),
        title: Text("Roads - High urgency"),
        subtitle: Text("No. 1/4, Seri Kembangan"),
        trailing: Text("March 18, 2025"),
      ),
    );
  }
}