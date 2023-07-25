import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:surf_practice_magic_ball/model/answer.dart';
import 'package:surf_practice_magic_ball/model/settings.dart';
import 'package:surf_practice_magic_ball/provider/answer_provider.dart';
import 'package:surf_practice_magic_ball/provider/settings_provider.dart';
import 'package:surf_practice_magic_ball/widget/circle.dart';

class AnimatedCircle extends ConsumerStatefulWidget {
  const AnimatedCircle({super.key});

  @override
  ConsumerState<AnimatedCircle> createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends ConsumerState<AnimatedCircle>
    with SingleTickerProviderStateMixin {
  late Answer _answer;
  late AnimationController _controller;
  Duration get _animationDuration => ref
      .read(settingsProvider)
      .firstWhere(
        (element) => element.type == SettingsType.circleAnimationDuration,
      )
      .value;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: _animationDuration,
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant AnimatedCircle oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.duration = _animationDuration;
    _controller
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _answer = ref.watch(answerProvider);

    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: _controller.value,
          child: child,
        );
      },
      child: Circle(
        radius: 0.5,
        color: _answer.isError ? const Color(0xffe71616) : Colors.black,
      ),
    );
  }
}
