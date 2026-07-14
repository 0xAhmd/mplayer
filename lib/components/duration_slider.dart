import 'package:flutter/material.dart';

class DurationSlider extends StatelessWidget {
  const DurationSlider({
    super.key,
    required this.position,
    required this.duration,
    required this.onSeek,
  });

  final Duration position;
  final Duration duration;
  final void Function(Duration) onSeek;

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.toString();
    final seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    // avoid a divide-by-zero flash while the track is still loading
    final maxMs =
        duration.inMilliseconds > 0 ? duration.inMilliseconds.toDouble() : 1.0;
    final valueMs = position.inMilliseconds.toDouble().clamp(0.0, maxMs);

    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            trackShape: const RoundedRectSliderTrackShape(),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
          ),
          child: Slider(
            activeColor: Theme.of(context).colorScheme.secondary,
            value: valueMs,
            min: 0,
            max: maxMs,
            onChanged: (value) {
              onSeek(Duration(milliseconds: value.toInt()));
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_formatDuration(position)),
              Text(_formatDuration(duration)),
            ],
          ),
        ),
      ],
    );
  }
}