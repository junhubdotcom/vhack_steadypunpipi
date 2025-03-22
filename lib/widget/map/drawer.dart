import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/screens/map/map.dart';
import 'package:steadypunpipi_vhack/screens/profile/profile.dart';
import 'package:steadypunpipi_vhack/screens/reportList/report.dart';

Drawer drawer(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.white),
          child: Text(
            'The Watcher', 
            style: TextStyle(
              color: Colors.black, 
              fontSize: 24, 
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        ListTile(
          title: const Text('Report List'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReportPage()),
            );
          },
        ),
        ListTile(
          title: const Text('Profile'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
        ),
      ],
    )
  );
}