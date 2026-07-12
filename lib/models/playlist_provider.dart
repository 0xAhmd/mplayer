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
  ];
}
