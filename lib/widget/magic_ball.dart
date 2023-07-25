import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:surf_practice_magic_ball/model/answer.dart';
import 'package:surf_practice_magic_ball/model/settings.dart';
import 'package:surf_practice_magic_ball/provider/answer_provider.dart';
import 'package:surf_practice_magic_ball/util/screen_dimensions.dart';
import 'package:surf_practice_magic_ball/widget/animated_circle.dart';

class MagicBall extends ConsumerStatefulWidget {
  const MagicBall({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return MagicBallState();
  }
}

class MagicBallState extends ConsumerState<MagicBall>
    with SingleTickerProviderStateMixin {
  late Answer answer;
  late AnimationController _animationController;
  late Animation<double> _animation;
  double answerOpacity = 1;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: UserSettings.opacityDuration,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward(from: 0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    answer = ref.watch(answerProvider);
    _animationController.forward(from: 0);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: elementWidth(400, context),
          height: elementHeight(400, context),
          child: Image.asset('assets/images/ball.png'),
        ),
        SizedBox(
          width: elementHeight(244.93, context),
          height: elementHeight(246.71, context),
          child: Image.asset('assets/images/star.png'),
        ),
        SizedBox(
          width: elementHeight(244.93, context),
          height: elementHeight(246.71, context),
          child: Image.asset('assets/images/stars_small.png'),
        ),
        SizedBox(
          width: elementHeight(310, context),
          height: elementHeight(310, context),
          child: const AnimatedCircle(),
        ),
        SizedBox(
          width: elementWidth(243, context),
          child: FadeTransition(
            opacity: _animation,
            child: Text(
              answer.text,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: textScaleFactor(context) * 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
