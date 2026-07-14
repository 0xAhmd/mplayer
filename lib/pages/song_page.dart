import 'package:flutter/material.dart';
import 'package:mplayer/components/cover_box.dart';
import 'package:mplayer/components/duration_slider.dart';
import 'package:mplayer/components/play_buttons.dart';
import 'package:mplayer/components/volume_slider.dart';

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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(centerTitle: true, title: Text(songName)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              CoverBox(songCover: songCover),
              const SizedBox(height: 24),
              Text(
                songName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                songArtist,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 32),
              const DurationSlider(),
              const SizedBox(height: 20),
              PlayButtons(
                onPlayPressed: () {},
                onNextPressed: () {},
                onPreviousPressed: () {},
              ),
              const SizedBox(height: 24),
              VolumeSlider(onVolumeChanged: (value) {}),
            ],
          ),
        ),
      ),
    );
  }
}
