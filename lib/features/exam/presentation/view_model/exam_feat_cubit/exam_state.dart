import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/exam/domain/entities/exam_entity.dart';
import 'package:testly/features/exam/domain/entities/subject_entity.dart';

class ExamState {
  final BaseState<List<SubjectEntity>>? subjects;
final BaseState<List<ExamEntity>>? exams;
  ExamState( {this.exams,
    this.subjects,
  });

  ExamState copyWith({
    BaseState<List<SubjectEntity>>? subjects,
      BaseState<List<ExamEntity>>? exams,
  }) {
    return ExamState(
      subjects: subjects ?? this.subjects,
        exams: exams ?? this.exams,
    );
  }
}