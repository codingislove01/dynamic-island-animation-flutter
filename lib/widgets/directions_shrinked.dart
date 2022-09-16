import 'package:flutter/cupertino.dart';

class DirectionsShrinked extends StatelessWidget {
  const DirectionsShrinked({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          CupertinoIcons.arrow_turn_up_right,
          size: 20,
          color: Color(0xFF83CBFB),
        ),
        const Spacer(),
        Row(
          children: [
            const Text('0.3', style: TextStyle(color: Color(0xFF83CBFB))),
            Transform.translate(
                offset: const Offset(0, -1),
                child: const Text('MI',
                    style: TextStyle(color: Color(0xFF83CBFB), fontSize: 8))),
          ],
        )
      ],
    );
  }
}
