class ForYouTabAnswerDto {
  String answer;
  bool isCorrect;

  ForYouTabAnswerDto({required this.answer, required this.isCorrect});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForYouTabAnswerDto &&
          runtimeType == other.runtimeType &&
          answer == other.answer &&
          isCorrect == other.isCorrect;

  @override
  int get hashCode => answer.hashCode ^ isCorrect.hashCode;

  @override
  String toString() {
    return 'ForYouTabAnswerDto{answer: $answer, isCorrect: $isCorrect}';
  }
}
