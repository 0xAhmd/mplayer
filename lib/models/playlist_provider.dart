import 'package:flutter/material.dart';
import 'package:mplayer/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlists = [
    Song(
      name: "Data Stream",
      artist: "Doris Roberts",
      image: "assets/images/playlist1.jpg",
      audioPath: "assets/audio/Data Stream.mp3",
    ),
    Song(
      name: "Data Stream",
      artist: "Doris Roberts",
      image: "assets/images/playlist1.jpg",
      audioPath: "assets/audio/Data Stream.mp3",
    ),
    Song(
      name: "Data Stream",
      artist: "Doris Roberts",
      image: "assets/images/playlist1.jpg",
      audioPath: "assets/audio/Data Stream.mp3",
    ),
    Song(
      name: "Data Stream",
      artist: "Doris Roberts",
      image: "assets/images/playlist1.jpg",
      audioPath: "assets/audio/Data Stream.mp3",
    ),
    Song(
      name: "Data Stream",
      artist: "Doris Roberts",
      image: "assets/images/playlist1.jpg",
      audioPath: "assets/audio/Data Stream.mp3",
    ),
  ];

  int? _currentIndex;
  // getters
  List<Song> get playlists => _playlists;
  int? get currentIndex => _currentIndex;
}
