import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mplayer/models/playlist_provider.dart';
import 'package:mplayer/pages/home_page.dart';
import 'package:mplayer/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => PlaylistProvider()),],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeProvider>(context).themeData;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData.copyWith(
        textTheme: GoogleFonts.interTextTheme(themeData.textTheme),
      ),
      home: const HomePage(),
    );
  }
}
