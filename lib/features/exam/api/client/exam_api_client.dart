import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:testly/features/exam/data/model/exam/exams_response.dart';
import 'package:testly/features/exam/data/model/subjects/subjects_response.dart';

part 'exam_api_client.g.dart';

@singleton
@RestApi()
abstract class ExamApiClient {
  @factoryMethod
  factory ExamApiClient(Dio dio) = _ExamApiClient;

  @GET('/subjects')
  Future<SubjectsResponse> getSubjects();
    @GET('/exams')
  Future<ExamsResponse> getExams(
    @Query('subject') String subjectId,
  );
}
