import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/models/map/noti_service.dart';
import 'package:steadypunpipi_vhack/screens/map/map.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotiService().initNotification();
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
      home: MapPage(),
    );
  }
}
