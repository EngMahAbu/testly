import 'package:testly/features/exam/data/model/local_models/saved_exam_model.dart';

 
abstract class ExamLocalDataSource {
  Future<void> saveExam(SavedExamModel exam);

  Future<List<SavedExamModel>> getSavedExams();

  Future<SavedExamModel?> getExamById(String examId);

  Future<void> deleteExam(String examId);

  Future<void> clearAll();
}