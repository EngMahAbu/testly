import 'package:testly/features/exam/domain/entities/local_entities/saved_answer_entity.dart';

class SavedAnswerModel {
  final String key;
  final String answer;

  const SavedAnswerModel({required this.key, required this.answer});

  factory SavedAnswerModel.fromEntity(SavedAnswerEntity entity) {
    return SavedAnswerModel(key: entity.key, answer: entity.answer);
  }

  SavedAnswerEntity toEntity() { 
    return SavedAnswerEntity(key: key, answer: answer);
  }
}
