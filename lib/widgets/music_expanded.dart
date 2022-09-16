import 'package:dynamic_island/widgets/audio_waves.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicExpanded extends StatelessWidget {
  const MusicExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                'https://picsum.photos/id/290/200/200',
                height: 60,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('THE MOVE', style: TextStyle(color: Colors.white)),
                Text('Space Rangers',
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.6),
                        fontWeight: FontWeight.w500,
                        fontSize: 14)),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [AudioWaves()],
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text('1:20',
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                    fontSize: 10)),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const LinearProgressIndicator(
                value: 0.25,
                backgroundColor: Colors.grey,
                color: Colors.white,
              ),
            )),
            const SizedBox(
              width: 8,
            ),
            Text('-1:48',
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                    fontSize: 10))
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    CupertinoIcons.backward_end_alt_fill,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.pause,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    CupertinoIcons.forward_end_alt_fill,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  CupertinoIcons.antenna_radiowaves_left_right,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ))
          ],
        )
      ],
    );
  }
}
