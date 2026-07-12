import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mplayer/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("S E T T I N G S", style: TextStyle(fontSize: 20)),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Theme.of(context).colorScheme.primary,
              ),
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              child: ListTile(
                title: Text("Dark Mode" , style: TextStyle(fontSize: 18 )),
                trailing: CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context).isDarkMode,
                  onChanged: (value) {
                    Provider.of<ThemeProvider>(
                      context,
                      listen: false,
                    ).toggleTheme();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
