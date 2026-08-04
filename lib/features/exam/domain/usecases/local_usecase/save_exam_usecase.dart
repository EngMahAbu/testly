import 'package:injectable/injectable.dart';
import 'package:testly/features/exam/domain/entities/local_entities/saved_exam_entity.dart';
import 'package:testly/features/exam/domain/repositories/exam_repository.dart';
@injectable
class SaveExamUseCase {
  final ExamRepository repository;

  SaveExamUseCase(this.repository);

  Future<void> call(SavedExamEntity exam) {
    return repository.saveExam(exam);
  }
}