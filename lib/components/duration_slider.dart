import 'package:flutter/material.dart';

class DurationSlider extends StatelessWidget {
  const DurationSlider({super.key});

  @override
  Widget build(BuildContext context) {
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
            children: [Text('1:12'), Text('3:24')],
          ),
        ),
      ],
    );
  }
}
