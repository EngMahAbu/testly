import 'saved_question_entity.dart';

class SavedExamEntity {
  final String examId;
  final String title;

  final DateTime submittedAt;

  final int totalQuestions;
  final int correctAnswers;
  final int wrongAnswers;

  final double percentage;

  final List<SavedQuestionEntity> questions;

  const SavedExamEntity({
    required this.examId,
    required this.title,
    required this.submittedAt,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.percentage,
    required this.questions,
  });
}