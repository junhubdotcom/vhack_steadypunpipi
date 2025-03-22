import 'package:flutter/material.dart';

Drawer drawer() {
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
          title: const Text('Item 1'),
          onTap: () {
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
          },
        ),
      ],
    )
  );
}