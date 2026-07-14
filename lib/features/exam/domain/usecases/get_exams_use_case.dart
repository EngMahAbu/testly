import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/exam/domain/entities/exam_entity.dart';
import 'package:testly/features/exam/domain/repositories/exam_repository.dart';

@injectable
class GetExamsUseCase {
  final ExamRepository repository;

  GetExamsUseCase(this.repository);

  Future<BaseResponse<List<ExamEntity>>> call(String subjectId) {
    return repository.getExams(subjectId);
  }
}