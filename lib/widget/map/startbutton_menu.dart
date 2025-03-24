import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/models/map/event_bus.dart';

class StartMenu extends StatelessWidget{
  const StartMenu({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            final eventBus = EventBus();
            eventBus.sendPrompt(9);
            Navigator.of(context).pop();
          },
          child: Container(
            height: 50,
            color: Colors.lightBlue[100],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Icon(Icons.directions_walk_rounded),
                  SizedBox(width: 12),
                  Text('Walking'),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            final eventBus = EventBus();
            eventBus.sendPrompt(9);
            Navigator.of(context).pop();
          },
          child: Container(
            height: 50,
            color: Colors.deepPurple[100],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Icon(Icons.drive_eta_rounded),
                  SizedBox(width: 12),
                  Text('Driving'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}