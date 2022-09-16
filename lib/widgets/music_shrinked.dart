import 'package:dynamic_island/widgets/audio_waves.dart';
import 'package:flutter/material.dart';

class MusicShrinked extends StatelessWidget {
  const MusicShrinked({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            'https://picsum.photos/id/290/200/200',
            height: 20,
            fit: BoxFit.contain,
          ),
        ),
        const Spacer(),
        const AudioWaves()
      ],
    );
  }
}
