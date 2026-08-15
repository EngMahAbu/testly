import 'package:testly/features/exam/domain/entities/local_entities/saved_exam_entity.dart';
import 'saved_question_model.dart';
 

class SavedExamModel {
  final String examId;
  final String title;
  final DateTime submittedAt;
  final int totalQuestions;
  final int correctAnswers;
  final int wrongAnswers;
  final double percentage;
  final List<SavedQuestionModel> questions;

  const SavedExamModel({
    required this.examId,
    required this.title,
    required this.submittedAt,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.percentage,
    required this.questions,
  });

  factory SavedExamModel.fromEntity(
    SavedExamEntity entity,
  ) {
    return SavedExamModel(
      examId: entity.examId,
      title: entity.title,
      submittedAt: entity.submittedAt,
      totalQuestions: entity.totalQuestions,
      correctAnswers: entity.correctAnswers,
      wrongAnswers: entity.wrongAnswers,
      percentage: entity.percentage,
      questions: entity.questions
          .map(SavedQuestionModel.fromEntity)
          .toList(),
    );
  }

  SavedExamEntity toEntity() {
    return SavedExamEntity(
      examId: examId,
      title: title,
      submittedAt: submittedAt,
      totalQuestions: totalQuestions,
      correctAnswers: correctAnswers,
      wrongAnswers: wrongAnswers,
      percentage: percentage,
      questions: questions
          .map((e) => e.toEntity())
          .toList(),
    );
  }
}