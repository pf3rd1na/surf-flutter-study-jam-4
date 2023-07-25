import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shake/shake.dart';
import 'package:surf_practice_magic_ball/model/answer.dart';
import 'package:surf_practice_magic_ball/provider/answer_provider.dart';
import 'package:surf_practice_magic_ball/screen/settings_screen.dart';
import 'package:surf_practice_magic_ball/util/http_manager.dart';
import 'package:surf_practice_magic_ball/util/screen_dimensions.dart';
import 'package:surf_practice_magic_ball/widget/animated_magic_ball.dart';
import 'package:surf_practice_magic_ball/widget/footer.dart';
import 'package:surf_practice_magic_ball/widget/magic_ball.dart';
import 'package:surf_practice_magic_ball/widget/shadow_images.dart';

class MagicBallScreen extends ConsumerStatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends ConsumerState<MagicBallScreen> {
  bool _isWaitingForAnswer = false;

  // This method is called when user tap on MagicBall or shake phone.
  // It makes request to server and shows answer.
  // If user tap on MagicBall or shake phone while waiting for answer, nothing happens.
  // This is done to prevent multiple requests to server.
  // If request is successful, answer is shown.
  // If request is unsuccessful, error is shown.
  void _tapHandler() async {
    if (_isWaitingForAnswer) return;

    AnswerNotifier answerNotifier = ref.read(answerProvider.notifier);
    Answer answer;
    _isWaitingForAnswer = true;
    try {
      answerNotifier.waitingForAnswer();
      final result = await HttpManager.makeRequest();
      answer = Answer.fromJson(json.decode(result.body));
    } catch (e) {
      answer = Answer.error(e);
    }
    answerNotifier.receiveAnswer(answer);
    _isWaitingForAnswer = false;
  }

  void _openSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SettingsScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(onPhoneShake: _tapHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, actions: [
        IconButton(
          onPressed: _openSettings,
          icon: const Icon(Icons.settings),
        ),
      ]),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black,
              Color(0xFF100c24),
            ],
          ),
        ),
        child: AspectRatio(
          aspectRatio: kReferenceWidth / kReferenceHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _tapHandler,
                // child: const MagicBall(),
                child: const AnimatedMagicBall(),
              ),
              SizedBox(height: elementHeight(76, context)),
              const ShadowImages(),
              SizedBox(height: elementHeight(59, context)),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
