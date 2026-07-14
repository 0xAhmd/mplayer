import 'package:flutter/material.dart';
import 'package:mplayer/components/cover_box.dart';
import 'package:mplayer/components/duration_slider.dart';
import 'package:mplayer/components/play_buttons.dart';
import 'package:mplayer/components/volume_slider.dart';
import 'package:mplayer/models/playlist_provider.dart';
import 'package:provider/provider.dart';

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
    return Consumer<PlaylistProvider>(
      builder: (context, playlistProvider, _) {
        final index = playlistProvider.currentIndex;
        final currentSong = index != null
            ? playlistProvider.playlists[index]
            : null;

        final name = currentSong?.name ?? songName;
        final artist = currentSong?.artist ?? songArtist;
        final cover = currentSong?.image ?? songCover;

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(centerTitle: true, title: Text(name)),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 48),
                  CoverBox(songCover: cover),
                  const SizedBox(height: 24),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    artist,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(height: 32),
                  DurationSlider(
                    position: playlistProvider.currentPosition,
                    duration: playlistProvider.totalDuration,
                    onSeek: playlistProvider.seek,
                  ),
                  const SizedBox(height: 20),
                  PlayButtons(
                    isPlaying: playlistProvider.isPlaying,
                    onPlayPressed: playlistProvider.playPause,
                    onNextPressed: playlistProvider.playNextSong,
                    onPreviousPressed: playlistProvider.playPreviousSong,
                  ),
                  const SizedBox(height: 24),
                  VolumeSlider(
                    volume: playlistProvider.volume,
                    onVolumeChanged: playlistProvider.setVolume,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}