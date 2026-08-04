import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/exam/domain/entities/exam_entity.dart';
import 'package:testly/features/exam/domain/entities/exam_result_entity.dart';
import 'package:testly/features/exam/domain/entities/local_entities/saved_exam_entity.dart';
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
  final BaseState<List<SavedExamEntity>> savedExams;
final BaseState<SavedExamEntity> selectedSavedExam;
 final ExamEntity? currentExam;
  ExamState({
  this.remainingSeconds = 0,
  this.isExamFinished = false,
  this.selectedAnswers = const {},
  this.currentQuestionIndex = 0,
  this.currentExam,
  BaseState<ExamResultEntity>? submitExam,
  this.questions,
  this.exams,
  this.subjects,
  BaseState<List<SavedExamEntity>>? savedExams,
  BaseState<SavedExamEntity>? selectedSavedExam,
})  : submitExam = submitExam ?? BaseState<ExamResultEntity>(),
      savedExams = savedExams ?? BaseState<List<SavedExamEntity>>(),
      selectedSavedExam =
          selectedSavedExam ?? BaseState<SavedExamEntity>();

  ExamState copyWith({
  BaseState<List<SubjectEntity>>? subjects,
  BaseState<List<ExamEntity>>? exams,
  BaseState<List<QuestionEntity>>? questions,
  BaseState<ExamResultEntity>? submitExam,
  BaseState<List<SavedExamEntity>>? savedExams,
  BaseState<SavedExamEntity>? selectedSavedExam,
  int? currentQuestionIndex,
  Map<String, String>? selectedAnswers,
  bool? isExamFinished,
  int? remainingSeconds,
   ExamEntity? currentExam,
}) {
  return ExamState(
  subjects: subjects ?? this.subjects,
  exams: exams ?? this.exams,
  questions: questions ?? this.questions,
  submitExam: submitExam ?? this.submitExam,
  savedExams: savedExams ?? this.savedExams,
  selectedSavedExam:
      selectedSavedExam ?? this.selectedSavedExam,
  currentExam: currentExam ?? this.currentExam,
  currentQuestionIndex:
      currentQuestionIndex ?? this.currentQuestionIndex,
  selectedAnswers: selectedAnswers ?? this.selectedAnswers,
  remainingSeconds: remainingSeconds ?? this.remainingSeconds,
  isExamFinished: isExamFinished ?? this.isExamFinished,
);
}
}
