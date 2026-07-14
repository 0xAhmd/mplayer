import 'package:flutter/material.dart';

class CoverBox extends StatelessWidget {
  const CoverBox({super.key, required this.songCover});
final String songCover;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
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
    );
  }
}
