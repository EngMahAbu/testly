import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/exam/domain/entities/subject_entity.dart';
import 'package:testly/features/exam/domain/repositories/exam_repository.dart';
@singleton
class GetSubjectsUseCase {
  GetSubjectsUseCase(this._examRepository);
  final ExamRepository _examRepository;

  Future<BaseResponse<List<SubjectEntity>>> call() {
    return _examRepository.getSubjects();
  }
}
