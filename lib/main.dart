import 'package:flutter/material.dart';
import 'package:mplayer/pages/home_page.dart';
import 'package:mplayer/themes/dark_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: darkMode,
      home: const HomePage(),
      
    );
  }
}
