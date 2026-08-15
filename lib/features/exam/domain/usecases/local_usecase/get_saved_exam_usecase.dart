import 'package:injectable/injectable.dart';
import 'package:testly/features/exam/domain/entities/local_entities/saved_exam_entity.dart';
import 'package:testly/features/exam/domain/repositories/exam_repository.dart';
@injectable
class GetSavedExamUseCase {
  final ExamRepository repository;

  GetSavedExamUseCase(this.repository);

  Future<SavedExamEntity?> call(String id) {
    return repository.getExamById(id);
  }
}