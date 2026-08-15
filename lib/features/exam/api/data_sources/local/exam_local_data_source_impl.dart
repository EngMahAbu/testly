import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:testly/features/exam/data/data_sources/local/exam_local_data_source.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testly/features/exam/data/model/local_models/saved_exam_model.dart';

@Injectable(as: ExamLocalDataSource)
class ExamLocalDataSourceImpl implements ExamLocalDataSource {
  final Box<SavedExamModel> box;

  ExamLocalDataSourceImpl(this.box);

  @override
  Future<void> saveExam(SavedExamModel exam) async {
    await box.put(exam.examId, exam);
  }

  @override
  Future<List<SavedExamModel>> getSavedExams() async {
    return box.values.toList();
  }

  @override
  Future<SavedExamModel?> getExamById(String examId) async {
    return box.get(examId);
  }

  @override
  Future<void> deleteExam(String examId) async {
    await box.delete(examId);
  }

  @override
  Future<void> clearAll() async {
    await box.clear();
  }
}
