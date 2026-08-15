import 'package:hive/hive.dart';
import 'package:testly/features/exam/data/model/local_models/saved_answer_model.dart';

 
class SavedAnswerAdapter extends TypeAdapter<SavedAnswerModel> {
  @override
  final int typeId = 20;

  @override
  SavedAnswerModel read(BinaryReader reader) {
    return SavedAnswerModel(
      key: reader.readString(),
      answer: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, SavedAnswerModel obj) {
    writer
      ..writeString(obj.key)
      ..writeString(obj.answer);
  }
}