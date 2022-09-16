import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DirectionsExpanded extends StatelessWidget {
  const DirectionsExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Expanded(
              child: Icon(
                CupertinoIcons.arrow_turn_up_left,
                color: Colors.grey,
                size: 30,
              ),
            ),
            Expanded(
              child: Icon(
                CupertinoIcons.arrow_up,
                color: Colors.grey,
                size: 30,
              ),
            ),
            Expanded(
              child: Icon(
                CupertinoIcons.arrow_up,
                color: Colors.grey,
                size: 30,
              ),
            ),
            Expanded(
              child: Icon(
                CupertinoIcons.arrow_turn_up_right,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('90 ft',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text('North',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    )),
                SizedBox(height: 5),
                Text('San Francisco',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    )),
              ]),
        )
      ],
    );
  }
}
