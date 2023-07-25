import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:surf_practice_magic_ball/model/answer.dart';

/// A provider that holds the current answer state and allows for updating it.
final answerProvider = StateNotifierProvider<AnswerNotifier, Answer>((ref) {
  return AnswerNotifier(Answer(text: 'Click me'));
});

/// A [StateNotifier] that manages the [Answer] state.
class AnswerNotifier extends StateNotifier<Answer> {
  /// Creates an [AnswerNotifier] with the given [state].
  AnswerNotifier(Answer state) : super(state);

  /// Updates the current answer state to the given [answer].
  void receiveAnswer(Answer answer) {
    state = answer;
  }

  /// Updates the current answer state to a waiting state.
  void waitingForAnswer() {
    state = Answer(text: '...', isWaiting: true);
  }
}
