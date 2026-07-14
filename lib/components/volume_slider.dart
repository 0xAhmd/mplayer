import 'package:flutter/material.dart';

class VolumeSlider extends StatelessWidget {
  const VolumeSlider({super.key, required this.onVolumeChanged});

  final void Function(double) onVolumeChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.volume_up_rounded),
        Slider(
          activeColor: Theme.of(context).colorScheme.secondary,
          value: 0.7,
          onChanged: onVolumeChanged,
          min: 0,
          max: 1,
        ),
      ],
    );
  }
}