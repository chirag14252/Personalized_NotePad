import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.yellow,
            ),
            child: Text('My Notes'),
          ),
          ListTile(
            title: Text('Completed'),
            onTap: () => {},
          ),
          ListTile(
            title: Text('Not Completed'),
            onTap: () => {},
          )
        ],
      ),
    );
  }
}
