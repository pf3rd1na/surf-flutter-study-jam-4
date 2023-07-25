class Answer {
  final String text;
  final bool isError;
  final bool isWaiting;

  Answer({
    required this.text,
    this.isError = false,
    this.isWaiting = false,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      text: json['reading'],
    );
  }

  factory Answer.error(Object error) {
    return Answer(
      text: 'Error: $error',
      isError: true,
    );
  }
}
