import 'package:injectable/injectable.dart';
import 'package:testly/features/exam/domain/entities/local_entities/saved_exam_entity.dart';
import 'package:testly/features/exam/domain/repositories/exam_repository.dart';
@injectable
class DeleteExamUseCase {
  final ExamRepository repository;

  DeleteExamUseCase(this.repository);

  Future<void> call(String id) {
    return repository.deleteExam(id);
  }
}