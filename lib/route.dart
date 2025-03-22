import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/screens/camera/camera.dart';
import 'package:steadypunpipi_vhack/screens/map/map.dart';
import 'package:steadypunpipi_vhack/screens/profile/profile.dart';
import 'package:steadypunpipi_vhack/screens/reportList/report.dart';


class AppRoutes {
  static final List<Widget> pages = [
    MapPage(),
    CameraPage(),
    ReportPage(),
    ProfilePage(),
  ];
}
