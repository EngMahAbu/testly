import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/exam/data/model/exam/exams_response.dart';
import 'package:testly/features/exam/data/model/subjects/subjects_response.dart';

abstract class ExamRemoteDataSource {
  Future<BaseResponse<SubjectsResponse>> getSubjects();
  Future<BaseResponse<ExamsResponse>> getExams(String subjectId);
}
