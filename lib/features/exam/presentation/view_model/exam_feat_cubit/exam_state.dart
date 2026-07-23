import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/exam/domain/entities/exam_entity.dart';
import 'package:testly/features/exam/domain/entities/exam_result_entity.dart';
import 'package:testly/features/exam/domain/entities/question_entity.dart';
import 'package:testly/features/exam/domain/entities/subject_entity.dart';

class ExamState {
  final BaseState<List<SubjectEntity>>? subjects;
  final BaseState<List<ExamEntity>>? exams;
  final BaseState<List<QuestionEntity>>? questions;
  final BaseState<ExamResultEntity> submitExam;
  final int currentQuestionIndex;
  final Map<String, String> selectedAnswers;
  final int remainingSeconds;
  final bool isExamFinished;
  ExamState({
    this.remainingSeconds = 0,
    this.isExamFinished = false,
    this.selectedAnswers = const {},
    this.currentQuestionIndex = 0,
    BaseState<ExamResultEntity>? submitExam,
    this.questions,
    this.exams,
    this.subjects,
  }) : submitExam = submitExam ?? BaseState<ExamResultEntity>();

  ExamState copyWith({
    BaseState<List<SubjectEntity>>? subjects,
    BaseState<List<ExamEntity>>? exams,
    BaseState<List<QuestionEntity>>? questions,
    BaseState<ExamResultEntity>? submitExam,
    int? currentQuestionIndex,
    Map<String, String>? selectedAnswers,
    bool? isExamFinished,
    int? remainingSeconds,
  }) {
    return ExamState(
      subjects: subjects ?? this.subjects,
      exams: exams ?? this.exams,
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isExamFinished: isExamFinished ?? this.isExamFinished,
      submitExam: submitExam ?? this.submitExam,
    );
  }
}
