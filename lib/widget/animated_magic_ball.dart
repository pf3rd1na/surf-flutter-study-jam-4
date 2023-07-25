import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:surf_practice_magic_ball/model/settings.dart';
import 'package:surf_practice_magic_ball/provider/settings_provider.dart';
import 'package:surf_practice_magic_ball/widget/magic_ball.dart';

/// This widget displays an animated [MagicBall]
class AnimatedMagicBall extends ConsumerStatefulWidget {
  const AnimatedMagicBall({super.key});

  @override
  ConsumerState<AnimatedMagicBall> createState() => _AnimatedMagicBallState();
}

class _AnimatedMagicBallState extends ConsumerState<AnimatedMagicBall>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late var settings = ref.watch(settingsProvider);
  Duration get _animationDuration => ref
      .read(settingsProvider)
      .firstWhere(
        (element) => element.type == SettingsType.ballBounceDuration,
      )
      .value;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: _animationDuration,
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
