import 'package:injectable/injectable.dart';
import 'package:testly/features/exam/domain/entities/local_entities/saved_exam_entity.dart';
import 'package:testly/features/exam/domain/repositories/exam_repository.dart';
@injectable
class GetSavedExamsUseCase {
  final ExamRepository repository;

  GetSavedExamsUseCase(this.repository);

  Future<List<SavedExamEntity>> call() {
    return repository.getSavedExams();
  }
}