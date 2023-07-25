import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/util/screen_dimensions.dart';

// This widget is used to show footer text.
// It is used in [magic_ball_screen.dart].
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Нажмите на шар\n  или потрясите телефон',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF727272),
            fontSize: textScaleFactor(context) * 16,
          ),
        ),
        SizedBox(
          height: elementHeight(56, context),
        )
      ],
    );
  }
}
