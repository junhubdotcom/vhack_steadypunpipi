import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:steadypunpipi_vhack/common/constantS.dart';
import 'route.dart';

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
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = AppRoutes.pages;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 60,
        color: Colors.cyan.shade400,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.map,
                color: Colors.black,
              ),
              onPressed: () {
                _onTabTapped(0); // Navigate to the MapPage
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.camera,
                color: Colors.black,
              ),
              onPressed: () {
                _onTabTapped(1); // Navigate to the CameraPage
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.flag,
                color: Colors.black,
              ),
              onPressed: () {
                _onTabTapped(2); // Navigate to the ReportPage
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              onPressed: () {
                _onTabTapped(3); // Navigate to the ProfilePage
              },
            ),
          ],
        ),
      ),
    );
  }
}
