import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/exam/domain/entities/question_entity.dart';
import 'package:testly/features/exam/domain/repositories/exam_repository.dart';
@singleton
class GetQuestionUseCase {
  final ExamRepository _examRepository;

  GetQuestionUseCase(this._examRepository);
  Future<BaseResponse<List<QuestionEntity>>> call(String examId) {
    return _examRepository.getQuestions(examId);
  }
}
