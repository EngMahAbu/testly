import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/exam/data/model/subjects_response.dart';

abstract class ExamRemoteDataSource {
  Future<BaseResponse<SubjectsResponse>> getSubjects();
}
