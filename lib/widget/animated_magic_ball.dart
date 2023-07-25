import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/model/settings.dart';
import 'package:surf_practice_magic_ball/widget/magic_ball.dart';

class AnimatedMagicBall extends StatefulWidget {
  const AnimatedMagicBall({super.key});

  @override
  State<AnimatedMagicBall> createState() => _AnimatedMagicBallState();
}

class _AnimatedMagicBallState extends State<AnimatedMagicBall>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: UserSettings.ballBounceDuration,
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(0, _controller.value * 10),
          child: const MagicBall(),
        );
      },
    );
  }
}
