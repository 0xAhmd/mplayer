import 'package:flutter/material.dart';
import 'package:mplayer/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          SizedBox(height: 128),

          Icon(Icons.music_note, size: 64),
          SizedBox(height: 56),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },

            leading: Icon(Icons.home, size: 32),
            title: Text('H O M E', style: TextStyle(fontSize: 16)),
          ),
          SizedBox(height: 8),

          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            leading: Icon(Icons.settings, size: 32),
            title: Text('S E T T I N G S', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
