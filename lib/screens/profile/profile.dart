import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/screens/profile/profileSection/StatsSection.dart';
import 'package:steadypunpipi_vhack/screens/profile/profileSection/headerProfile.dart';
import 'package:steadypunpipi_vhack/screens/profile/profileSection/pastReport.dart';
import 'package:steadypunpipi_vhack/screens/profile/profileSection/reward.dart';

import 'profileSection/chartSection.dart';
 
//  void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Tab Navigation',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: ProfilePage(),
//     );
//   }
// }
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
                child: StatsSection(),
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


