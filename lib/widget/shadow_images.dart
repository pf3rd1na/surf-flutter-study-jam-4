import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:surf_practice_magic_ball/provider/answer_provider.dart';
import 'package:surf_practice_magic_ball/util/screen_dimensions.dart';

/// A widget that shows a shadow under the ball in the [MagicBallScreen].
/// The color of the shadow changes to red if there is an error in the answer.
class ShadowImages extends ConsumerWidget {
  const ShadowImages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final answer = ref.watch(answerProvider);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: elementWidth(246, context),
          height: elementHeight(42, context),
          child: answer.isError
              ? ColorFiltered(
                  colorFilter:
                      const ColorFilter.mode(Colors.red, BlendMode.color),
                  child: Image.asset('assets/images/bottom_glow_big.png'),
                )
              : Image.asset('assets/images/bottom_glow_big.png'),
        ),
        Positioned(
          bottom: elementHeight(5, context),
          child: SizedBox(
            width: elementWidth(100, context),
            height: elementHeight(19, context),
            child: answer.isError
                ? ColorFiltered(
                    colorFilter:
                        const ColorFilter.mode(Colors.red, BlendMode.color),
                    child: Image.asset('assets/images/bottom_glow_small.png'),
                  )
                : Image.asset('assets/images/bottom_glow_small.png'),
          ),
        ),
      ],
    );
  }
}
