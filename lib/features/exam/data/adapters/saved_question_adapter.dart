import 'package:hive/hive.dart';
import 'package:testly/features/exam/data/model/local_models/saved_answer_model.dart';
import 'package:testly/features/exam/data/model/local_models/saved_question_model.dart';
 

class SavedQuestionAdapter extends TypeAdapter<SavedQuestionModel> {
  @override
  final int typeId = 21;

  @override
  SavedQuestionModel read(BinaryReader reader) {
    return SavedQuestionModel(
      id: reader.readString(),
      question: reader.readString(),
      answers: (reader.read() as List).cast<SavedAnswerModel>(),
      selectedAnswer: reader.readString(),
      correctAnswer: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, SavedQuestionModel obj) {
    writer
      ..writeString(obj.id)
      ..writeString(obj.question)
      ..write(obj.answers)
      ..writeString(obj.selectedAnswer)
      ..writeString(obj.correctAnswer);
  }
}