import 'package:flutter/material.dart';

class reportWidget extends StatelessWidget {
  final List<Map<String, dynamic>> reportOptions = [
    {'icon': Icon(Icons.traffic, size: 36, color: Colors.black87), 'label': 'Traffic'},
    {'icon': Icon(Icons.local_police, size: 36, color: Colors.black87), 'label': 'Police'},
    {'icon': Icon(Icons.car_crash, size: 36, color: Colors.black87), 'label': 'Accident'},
    {'icon': Icon(Icons.warning, size: 36, color: Colors.black87), 'label': 'Hazard'},
    {'icon': Icon(Icons.block, size: 36, color: Colors.black87), 'label': 'Closure'},
    {'icon': Icon(Icons.construction, size: 36, color: Colors.black87), 'label': 'Blocked lane'},
    {'icon': Icon(Icons.map, size: 36, color: Colors.black87), 'label': 'Map Issue'},
    {'icon': Icon(Icons.cloud, size: 36, color: Colors.black87), 'label': 'Bad weather'},
    {'icon': Icon(Icons.local_gas_station, size: 36, color: Colors.black87), 'label': 'Fuel prices'},
    {'icon': Icon(Icons.support, size: 36, color: Colors.black87), 'label': 'Roadside help'},
    {'icon': Icon(Icons.chat, size: 36, color: Colors.black87), 'label': 'Map chat'},
    {'icon': Icon(Icons.place, size: 36, color: Colors.black87), 'label': 'Place'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 400, // Set a fixed height to avoid unbounded error
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(), // Prevents internal scrolling
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.9,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: reportOptions.length,
          itemBuilder: (context, index) {
            return Column(
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
            );
          },
        ),
      ),
    );
  }
}
