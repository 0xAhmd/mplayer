import 'package:flutter/material.dart';

class SongPage extends StatelessWidget {
  final String songName;
  final String songArtist;
  final String songCover;

  const SongPage({
    super.key,
    required this.songName,
    required this.songArtist,
    required this.songCover,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(songName)),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(
                fit: BoxFit.cover,
                image: Image.asset(songCover).image,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 24,),
            child: Text(
              songName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 24.0,),
            child: Text(
              songArtist,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
