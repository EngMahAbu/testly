class ExamResultEntity {
  final int totalQuestions;
  final int correctAnswers;
  final int wrongAnswers;
  final double percentage;

  const ExamResultEntity({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.percentage, Object? examId, Object? finishedAt, Object? reviewQuestions,
  });
}