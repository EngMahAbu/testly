import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/exam/domain/entities/subject_entity.dart';

class ExamState {
  final BaseState<List<SubjectEntity>>? subjects;

  ExamState({
    this.subjects,
  });

  ExamState copyWith({
    BaseState<List<SubjectEntity>>? subjects,
  }) {
    return ExamState(
      subjects: subjects ?? this.subjects,
    );
  }
}