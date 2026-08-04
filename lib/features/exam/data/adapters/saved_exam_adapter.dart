import 'package:hive/hive.dart';
import 'package:testly/features/exam/data/model/local_models/saved_exam_model.dart';
import 'package:testly/features/exam/data/model/local_models/saved_question_model.dart';

 

class SavedExamAdapter extends TypeAdapter<SavedExamModel> {
  @override
  final int typeId = 22;

  @override
  SavedExamModel read(BinaryReader reader) {
    return SavedExamModel(
      examId: reader.readString(),
      title: reader.readString(),
      submittedAt: reader.read(),
      totalQuestions: reader.readInt(),
      correctAnswers: reader.readInt(),
      wrongAnswers: reader.readInt(),
      percentage: reader.readDouble(),
      questions: (reader.read() as List).cast<SavedQuestionModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, SavedExamModel obj) {
    writer
      ..writeString(obj.examId)
      ..writeString(obj.title)
      ..write(obj.submittedAt)
      ..writeInt(obj.totalQuestions)
      ..writeInt(obj.correctAnswers)
      ..writeInt(obj.wrongAnswers)
      ..writeDouble(obj.percentage)
      ..write(obj.questions);
  }
}