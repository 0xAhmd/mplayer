import 'package:flutter/material.dart';
import 'package:mplayer/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlists = [
    Song(
      name: "Data Stream",
      artist: "Doris Roberts",
      image: "assets/images/dataStream.jpg",
      audioPath: "assets/audio/Data Stream.mp3",
    ),
    Song(
      name: "Tabeb Garah",
      artist: "George Wassouf",
      image: "assets/images/tabeb_gara7.png",
      audioPath: "assets/audio/Tabeb gara7.mp3",
    ),
    Song(
      name: "VIVD VICE",
      artist: "Who-ya Extended",
      image: "assets/images/Vivid_Vice_cover.png",
      audioPath: "assets/audio/VIVID VICE.mp3",
    ),
    Song(
      name: "Met'asema",
      artist: "Ramadan El Brens",
      image: "assets/images/met2asema.jpg",
      audioPath: "assets/audio/Met'asema.mp3",
    ),
    Song(
      name: "The Less I know The Better",
      artist: "Tame Impala",
      image: "assets/images/the_less_iknow_thebetter.jpg",
      audioPath: "assets/audio/The Less I know The Better.mp3",
    ),
    Song(
      name: "Grabt El Hob Mara",
      artist: "Shafe2a",
      image: "assets/images/grbt_elhob_mara.jpg",
      audioPath: "assets/audio/Garabt_El_7ob_Mara",
    ),
  ];

  int? _currentIndex;
  // getters
  List<Song> get playlists => _playlists;
  int? get currentIndex => _currentIndex;
}
