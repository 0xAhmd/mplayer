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
          const SizedBox(height: 128),

          const Icon(Icons.music_note_rounded, size: 64),
          const SizedBox(height: 56),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },

            leading: const Icon(Icons.home, size: 32),
            title: const Text('H O M E', style: TextStyle(fontSize: 16)),
          ),
          const SizedBox(height: 8),

          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            leading: const Icon(Icons.settings, size: 32),
            title: const Text('S E T T I N G S', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
