import 'package:flutter/material.dart';

class VolumeSlider extends StatelessWidget {
  const VolumeSlider({
    super.key,
    required this.volume,
    required this.onVolumeChanged,
  });

  final double volume;
  final void Function(double) onVolumeChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(volume == 0 ? Icons.volume_off_rounded : Icons.volume_up_rounded),
        Expanded(
          child: Slider(
            activeColor: Theme.of(context).colorScheme.secondary,
            value: volume,
            onChanged: onVolumeChanged,
            min: 0,
            max: 1,
          ),
        ),
      ],
    );
  }
}