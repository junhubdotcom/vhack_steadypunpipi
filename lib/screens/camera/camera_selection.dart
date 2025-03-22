import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/screens/camera/camera.dart';
import 'package:steadypunpipi_vhack/screens/camera/manual_report.dart';

class CameraSelection extends StatelessWidget {
  const CameraSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManualReport(),
                  ));
            },
            child: Text('Manual'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraPage(),
                  ));
            },
            child: Text('Camera'),
          )
        ]),
      ),
    );
  }
}
