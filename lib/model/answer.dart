class Answer {
  final String answer;
  final bool isError;

  Answer({
    required this.answer,
    this.isError = false,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      answer: json['reading'],
    );
  }

  factory Answer.error(Object error) {
    return Answer(
      answer: 'Error: $error',
      isError: true,
    );
  }
}
