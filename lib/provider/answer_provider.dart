import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:surf_practice_magic_ball/model/answer.dart';

final answerProvider = StateNotifierProvider<AnswerNotifier, Answer>((ref) {
  return AnswerNotifier(Answer(text: 'Click me'));
});

class AnswerNotifier extends StateNotifier<Answer> {
  AnswerNotifier(Answer state) : super(state);

  void receiveAnswer(Answer answer) {
    state = answer;
  }

  void waitingForAnswer() {
    state = Answer(text: '...', isWaiting: true);
  }
}
