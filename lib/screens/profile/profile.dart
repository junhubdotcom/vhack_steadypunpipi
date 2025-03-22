import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/screens/profile/profileSection/StatsSection.dart';
import 'package:steadypunpipi_vhack/screens/profile/profileSection/headerProfile.dart';
import 'package:steadypunpipi_vhack/screens/profile/profileSection/pastReport.dart';
import 'package:steadypunpipi_vhack/screens/profile/profileSection/reward.dart';

import 'profileSection/chartSection.dart';
 
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
            StatsSection(),
            ChartSection(),
            PastReportsSection(),
            MyRewardsSection(),
          ],
       )),
     );
   }
 }


