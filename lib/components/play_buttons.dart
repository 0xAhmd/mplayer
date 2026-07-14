import 'package:flutter/material.dart';

class PlayButtons extends StatelessWidget {
  const PlayButtons({super.key, required this.onPlayPressed, required this.onNextPressed, required this.onPreviousPressed});

final void Function() onPlayPressed;
final void Function() onNextPressed;
final void Function() onPreviousPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: onPreviousPressed,
                    iconSize: 34,
                    icon: const Icon(Icons.skip_previous_rounded),
                  ),
                  const SizedBox(width: 16),
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: IconButton(
                      onPressed: onPlayPressed,
                      iconSize: 32,
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: onNextPressed,
                    iconSize: 34,
                    icon: const Icon(Icons.skip_next_rounded),
                  ),
                ],
              );
  }
}