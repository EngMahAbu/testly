import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/exam/domain/entities/exam_entity.dart';
import 'package:testly/features/exam/domain/entities/local_entities/saved_exam_entity.dart';
import 'package:testly/features/exam/domain/entities/question_entity.dart';
import 'package:testly/features/exam/domain/entities/subject_entity.dart';

abstract class ExamRepository {
  Future<BaseResponse<List<SubjectEntity>>> getSubjects();
  Future<BaseResponse<List<ExamEntity>>> getExams(String subjectId);
  Future<BaseResponse<List<QuestionEntity>>> getQuestions(String examId);


    Future<void> saveExam(SavedExamEntity exam);

  Future<List<SavedExamEntity>> getSavedExams();

  Future<SavedExamEntity?> getExamById(String examId);

  Future<void> deleteExam(String examId);

  Future<void> clearAll();
}
