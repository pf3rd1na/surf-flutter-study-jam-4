/// A class representing an answer to a question.
class Answer {
  /// The text of the answer.
  final String text;

  /// Whether the answer represents an error.
  final bool isError;

  /// Whether the answer is still waiting for a response.
  final bool isWaiting;

  /// Creates a new instance of [Answer].
  ///
  /// [text] is the text of the answer.
  /// [isError] indicates whether the answer represents an error.
  /// [isWaiting] indicates whether the answer is still waiting for a response.
  Answer({
    required this.text,
    this.isError = false,
    this.isWaiting = false,
  });

  /// Creates a new instance of [Answer] from a JSON map.
  ///
  /// [json] is the JSON map to create the answer from.
  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      text: json['reading'],
    );
  }

  /// Creates a new instance of [Answer] representing an error.
  ///
  /// [error] is the error object to create the answer from.
  factory Answer.error(Object error) {
    return Answer(
      text: 'Error: $error',
      isError: true,
    );
  }
}
