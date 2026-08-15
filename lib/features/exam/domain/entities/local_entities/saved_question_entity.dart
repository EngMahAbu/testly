import 'saved_answer_entity.dart';

class SavedQuestionEntity {
  final String id;
  final String question;
  final List<SavedAnswerEntity> answers;

  final String selectedAnswer;
  final String correctAnswer;

  const SavedQuestionEntity({
    required this.id,
    required this.question,
    required this.answers,
    required this.selectedAnswer,
    required this.correctAnswer,
  });
}