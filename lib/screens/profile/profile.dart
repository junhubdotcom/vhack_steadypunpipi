import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/screens/profile/profileSection/StatsSection.dart';
import 'package:steadypunpipi_vhack/screens/profile/profileSection/headerProfile.dart';
import 'package:steadypunpipi_vhack/screens/profile/profileSection/pastReport.dart';
import 'package:steadypunpipi_vhack/screens/profile/profileSection/reward.dart';

import 'profileSection/chartSection.dart';

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


