import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
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
      audioPath: "assets/audio/The Less I Know The Better.mp3",
    ),
    Song(
      name: "Grabt El Hob Mara",
      artist: "Shafe2a",
      image: "assets/images/grbt_elhob_mara.jpg",
      audioPath: "assets/audio/Garabt_El_7ob_Mara.mp3",
    ),
  ];

  final AudioPlayer _audioPlayer = AudioPlayer();

  int? _currentIndex;
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  double _volume = 0.7;

  late final StreamSubscription<PlayerState> _playerStateSubscription;
  late final StreamSubscription<Duration> _positionSubscription;
  late final StreamSubscription<Duration?> _durationSubscription;

  PlaylistProvider() {
    _audioPlayer.setVolume(_volume);

    _playerStateSubscription = _audioPlayer.playerStateStream.listen((state) {
      _isPlaying = state.playing;

      if (state.processingState == ProcessingState.completed) {
        playNextSong();
      }
      notifyListeners();
    });

    _positionSubscription = _audioPlayer.positionStream.listen((position) {
      _currentPosition = position;
      notifyListeners();
    });

    _durationSubscription = _audioPlayer.durationStream.listen((duration) {
      _totalDuration = duration ?? Duration.zero;
      notifyListeners();
    });
  }

  // getters
  List<Song> get playlists => _playlists;
  int? get currentIndex => _currentIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentPosition => _currentPosition;
  Duration get totalDuration => _totalDuration;
  double get volume => _volume;

  set currentIndex(int? index) {
    _currentIndex = index;
    notifyListeners();

    if (index != null) {
      _loadAndPlay(index);
    }
  }

  Future<void> _loadAndPlay(int index) async {
    try {
      await _audioPlayer.setAsset(_playlists[index].audioPath);
      await _audioPlayer.play();
    } catch (e) {
      debugPrint('PlaylistProvider: failed to load ${_playlists[index].audioPath} -> $e');
    }
  }

  Future<void> playPause() async {
    if (_currentIndex == null) return;

    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
  }

  Future<void> playNextSong() async {
    if (_currentIndex == null) return;

    if (_currentIndex! < _playlists.length - 1) {
      currentIndex = _currentIndex! + 1;
    } else {
      currentIndex = 0;
    }
  }

  Future<void> playPreviousSong() async {
    if (_currentIndex == null) return;

    // if we're more than 3 seconds into the song, restart it instead
    // of jumping to the previous track (standard music-player behavior)
    if (_currentPosition.inSeconds > 3) {
      await seek(Duration.zero);
      return;
    }

    if (_currentIndex! > 0) {
      currentIndex = _currentIndex! - 1;
    } else {
      currentIndex = _playlists.length - 1;
    }
  }

  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  Future<void> setVolume(double volume) async {
    _volume = volume;
    await _audioPlayer.setVolume(volume);
    notifyListeners();
  }

  @override
  void dispose() {
    _playerStateSubscription.cancel();
    _positionSubscription.cancel();
    _durationSubscription.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }
}