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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: Text(songName),
        
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
              
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      songCover,
                      width: 360,
                      height: 360,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
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
                style:  TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 32),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                  trackShape: const RoundedRectSliderTrackShape(),
                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
                ),
                child: Slider(
                  activeColor: Theme.of(context).colorScheme.secondary,
                  value: 0.35,
                  onChanged: (_) {},
                  min: 0,
                  max: 1,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('1:12'),
                    Text('3:24'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    iconSize: 34,
                    icon: const Icon(Icons.skip_previous_rounded),
                  ),
                  const SizedBox(width: 16),
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: IconButton(
                      onPressed: () {},
                      iconSize: 32,
                      icon: const Icon(Icons.play_arrow_rounded, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {},
                    iconSize: 34,
                    icon: const Icon(Icons.skip_next_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Icon(Icons.volume_up_rounded),
                  Slider(
                    activeColor: Theme.of(context).colorScheme.secondary,
                    value: 0.7,
                    onChanged: (_) {},
                    min: 0,
                    max: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
