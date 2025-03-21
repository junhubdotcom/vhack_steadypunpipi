import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/models/map/event_bus.dart';

class reportWidget extends StatelessWidget {
  final List<Map<String, dynamic>> reportOptions = [
    {'icon': Image.asset('assets/images/pothole.png', height: 36, width: 36), 'label': 'Pothole'},
    {'icon': Image.asset('assets/images/fallentree.png', height: 36, width: 36), 'label': 'Fallen Tree'},
    {'icon': Image.asset('assets/images/accident.png', height: 36, width: 36), 'label': 'Accident'},
    {'icon': Image.asset('assets/images/broken_streetlight.png', height: 36, width: 36), 'label': 'Broken Streetlight'},
    {'icon': Image.asset('assets/images/road_construction.png', height: 36, width: 36), 'label': 'Road Construction'},
    {'icon': Image.asset('assets/images/blocked_road.png', height: 36, width: 36), 'label': 'Road Obstruction'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: const Text(
              'Report an Issue',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), 
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.9,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: reportOptions.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final eventBus = EventBus();
                  eventBus.sendPrompt(index+1);
                  Navigator.of(context).pop();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.grey[200],
                      child: reportOptions[index]['icon'],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      reportOptions[index]['label'],
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
