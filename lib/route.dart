import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/screens/camera/camera.dart';
import 'package:steadypunpipi_vhack/screens/camera/camera_selection.dart';
import 'package:steadypunpipi_vhack/screens/map/map.dart';
import 'package:steadypunpipi_vhack/screens/reportList/report.dart';


class AppRoutes {
  static final List<Widget> pages = [
    MapPage(),
    CameraSelection(),
    ReportPage(),
    ReportPage(),
  ];
}
