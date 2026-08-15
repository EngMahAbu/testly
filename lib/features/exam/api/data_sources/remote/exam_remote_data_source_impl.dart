import 'package:injectable/injectable.dart';
import 'package:testly/config/api_error_handler/api_error_handler.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/exam/api/client/exam_api_client.dart';
import 'package:testly/features/exam/data/data_sources/remote/exam_remote_data_source.dart';
import 'package:testly/features/exam/data/model/exam/exams_response.dart';
import 'package:testly/features/exam/data/model/question/question_response.dart';
import 'package:testly/features/exam/data/model/subjects/subjects_response.dart';

@Singleton(as: ExamRemoteDataSource)
class ExamRemoteDataSourceImpl implements ExamRemoteDataSource {
  final ExamApiClient apiClient;

  ExamRemoteDataSourceImpl(this.apiClient);

  @override
  Future<BaseResponse<SubjectsResponse>> getSubjects() async {
    try {
      final response = await apiClient.getSubjects();
      return SuccessResponse(response);
    } on Exception catch (e) {
      return ApiErrorHandler.handleException(e);
    }
  }

  @override
  Future<BaseResponse<ExamsResponse>> getExams(String subjectId) async {
    try {
      final examResponse = await apiClient.getExams(subjectId);
      return SuccessResponse(examResponse);
    } on Exception catch (e) {
      return ApiErrorHandler.handleException(e);
    }
  }

  @override
  Future<BaseResponse<QuestionResponse>> getQuestions(String examId) async {
    try {
      final questionResponse = await apiClient.getQuestions(examId);

      return SuccessResponse(questionResponse);
    } on Exception catch (e) {
      return ApiErrorHandler.handleException(e);
    }
  }
}
