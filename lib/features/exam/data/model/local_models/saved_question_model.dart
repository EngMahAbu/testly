import 'package:testly/features/exam/domain/entities/local_entities/saved_question_entity.dart';
 
import 'saved_answer_model.dart';
 
class SavedQuestionModel {
  final String id;
  final String question;
  final List<SavedAnswerModel> answers;
  final String selectedAnswer;
  final String correctAnswer;

  const SavedQuestionModel({
    required this.id,
    required this.question,
    required this.answers,
    required this.selectedAnswer,
    required this.correctAnswer,
  });

  factory SavedQuestionModel.fromEntity(
    SavedQuestionEntity entity,
  ) {
    return SavedQuestionModel(
      id: entity.id,
      question: entity.question,
      answers: entity.answers
          .map(SavedAnswerModel.fromEntity)
          .toList(),
      selectedAnswer: entity.selectedAnswer,
      correctAnswer: entity.correctAnswer,
    );
  }

  SavedQuestionEntity toEntity() {
    return SavedQuestionEntity(
      id: id,
      question: question,
      answers: answers
          .map((e) => e.toEntity())
          .toList(),
      selectedAnswer: selectedAnswer,
      correctAnswer: correctAnswer,
    );
  }
}