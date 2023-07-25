import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/util/screen_dimensions.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  void _tapHandler() {
    print('tap');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              Colors.black,
              Color(0xFF100c24),
            ])),
        width: double.infinity,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _tapHandler,
                child: Stack(children: [
                  Image.asset('assets/images/ball.png'),
                  ColorFiltered(
                    colorFilter:
                        const ColorFilter.mode(Colors.red, BlendMode.color),
                    child: Image.asset('assets/images/ball_background.png'),
                  ),
                ]),
              ),
              SizedBox(height: elementHeight(76, context)),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                      width: elementWidth(246, context),
                      height: elementHeight(42, context),
                      child: Image.asset('assets/images/bottom_glow_big.png')),
                  Padding(
                    padding: EdgeInsets.only(bottom: elementHeight(5, context)),
                    child: SizedBox(
                        width: elementWidth(100, context),
                        height: elementHeight(19, context),
                        child:
                            Image.asset('assets/images/bottom_glow_small.png')),
                  ),
                ],
              ),
              SizedBox(height: elementHeight(59, context)),
              const Text(
                'Нажмите на шар\n  или потрясите телефон',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF727272),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
