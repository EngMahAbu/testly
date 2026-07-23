import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/exam/data/data_sources/remote/exam_remote_data_source.dart';
import 'package:testly/features/exam/data/model/exam/exams_response.dart';
import 'package:testly/features/exam/data/model/question/question_response.dart';
import 'package:testly/features/exam/data/model/subjects/subjects_response.dart';
import 'package:testly/features/exam/domain/entities/exam_entity.dart';
import 'package:testly/features/exam/domain/entities/question_entity.dart';
import 'package:testly/features/exam/domain/entities/subject_entity.dart';
import 'package:testly/features/exam/domain/repositories/exam_repository.dart';

@Singleton(as: ExamRepository)
class ExamRepositoryImpl implements ExamRepository {
  final ExamRemoteDataSource _examRemoteDataSource;

  ExamRepositoryImpl(this._examRemoteDataSource);

  @override
  Future<BaseResponse<List<SubjectEntity>>> getSubjects() async {
    final response = await _examRemoteDataSource.getSubjects();
    switch (response) {
      case SuccessResponse<SubjectsResponse>():
        return SuccessResponse(
          response.data?.subjects?.map((e) => e.toEntity()).toList() ?? [],
        );
      case ErrorResponse<SubjectsResponse>():
        return ErrorResponse(response.errorMessage);
    }
  }

  @override
  Future<BaseResponse<List<ExamEntity>>> getExams(String subjectId) async {
    final examResponse = await _examRemoteDataSource.getExams(subjectId);
    switch (examResponse) {
      case SuccessResponse<ExamsResponse>():
        return SuccessResponse(
          examResponse.data?.exams.map((e) => e.toEntity()).toList() ?? [],
        );
      case ErrorResponse<ExamsResponse>():
        return ErrorResponse(examResponse.errorMessage);
    }
  }

  @override
  Future<BaseResponse<List<QuestionEntity>>> getQuestions(String examId) async {
    final questionResponse = await _examRemoteDataSource.getQuestions(examId);
    switch (questionResponse) {
      case SuccessResponse<QuestionResponse>():
        return SuccessResponse(
          questionResponse.data?.questions.map((e) => e.toEntity()).toList() ??
              [],
        );
      case ErrorResponse<QuestionResponse>():
        return ErrorResponse(questionResponse.errorMessage);
    }
  }
}
