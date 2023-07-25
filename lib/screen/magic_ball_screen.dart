import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/model/answer.dart';
import 'package:surf_practice_magic_ball/util/http_manager.dart';
import 'package:surf_practice_magic_ball/util/screen_dimensions.dart';
import 'package:surf_practice_magic_ball/widget/circle.dart';

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  Answer _answer = Answer(answer: 'Click me');
  bool _isWaitingForAnswer = false;

  void _tapHandler() async {
    if (_isWaitingForAnswer) return;

    _isWaitingForAnswer = true;
    try {
      final result = await HttpManager.makeRequest();
      _answer = Answer.fromJson(json.decode(result.body));
    } catch (e) {
      _answer = Answer.error(e);
    }
    _isWaitingForAnswer = false;

    setState(() {});
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
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/ball.png'),
                    SizedBox(
                      width: elementHeight(244.93, context),
                      height: elementHeight(246.71, context),
                      child: Image.asset('assets/images/star.png'),
                    ),
                    SizedBox(
                      width: elementHeight(310, context),
                      height: elementHeight(310, context),
                      child: Cirle(
                        radius: 0.8,
                        color: _answer.isError
                            ? const Color(0xffe71616)
                            : Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: elementWidth(243, context),
                      // height: elementHeight(72, context),
                      child: Text(
                        _answer.answer,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: elementHeight(76, context)),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                      width: elementWidth(246, context),
                      height: elementHeight(42, context),
                      child: Image.asset('assets/images/bottom_glow_big.png')),
                  Positioned(
                    bottom: elementHeight(5, context),
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
