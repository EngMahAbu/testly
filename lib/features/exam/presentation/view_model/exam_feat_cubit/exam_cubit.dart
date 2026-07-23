import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/exam/domain/entities/exam_entity.dart';
import 'package:testly/features/exam/domain/entities/question_entity.dart';
import 'package:testly/features/exam/domain/entities/subject_entity.dart';
import 'package:testly/features/exam/domain/usecases/get_exams_use_case.dart';
import 'package:testly/features/exam/domain/usecases/get_question_use_case.dart';
import 'package:testly/features/exam/domain/usecases/get_subjects_use_case.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_events.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_state.dart';

import '../../../domain/entities/exam_result_entity.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  final GetSubjectsUseCase _getSubjectsUseCase;
  final GetExamsUseCase _getExamsUseCase;
  final GetQuestionUseCase _getQuestionUseCase;
  Timer? _timer;
  // bool isTimeout = false;
  Map<String, String> selectedAnswers = {};
  ExamCubit(
    this._getSubjectsUseCase,
    this._getExamsUseCase,
    this._getQuestionUseCase,
  ) : super(ExamState(subjects: BaseState()));

  void doEvent(ExamEvents event) {
    switch (event) {
      case GetSubjects():
        _getSubjects();
      case GetExams():
        _getExams(event.subjectId);
      case GetQuestions():
        _getQuestions(event.examId, event.examTime);
      case NextQuestion():
        _nextQuestion();
      case PreviousQuestion():
        _previousQuestion();
      case SubmitExam():
        _submitExam();
      case SelectAnswer():
        _selectAnswer(questionId: event.questionId, answerKey: event.answerKey);
    }
  }

  Future<void> _getSubjects() async {
    emit(state.copyWith(subjects: state.subjects?.copyWith(isLoading: true)));

    final response = await _getSubjectsUseCase();

    switch (response) {
      case SuccessResponse<List<SubjectEntity>>():
        emit(
          state.copyWith(
            subjects: state.subjects?.copyWith(
              isLoading: false,
              data: response.data,
            ),
          ),
        );

      case ErrorResponse<List<SubjectEntity>>():
        emit(
          state.copyWith(
            subjects: state.subjects?.copyWith(
              isLoading: false,
              errorMessage: response.errorMessage,
            ),
          ),
        );
    }
  }

  Future<void> _getExams(String subjectId) async {
    emit(state.copyWith(exams: state.exams?.copyWith(isLoading: true)));
    final examsResponse = await _getExamsUseCase(subjectId);
    switch (examsResponse) {
      case SuccessResponse<List<ExamEntity>>():
        emit(
          state.copyWith(
            exams: BaseState(data: examsResponse.data, isLoading: false),
          ),
        );
      case ErrorResponse<List<ExamEntity>>():
        emit(
          state.copyWith(
            exams: BaseState(
              isLoading: false,
              errorMessage: examsResponse.errorMessage,
            ),
          ),
        );
    }
  }

  Future<void> _getQuestions(String examId, int examTime) async {
    emit(
      state.copyWith(questions: BaseState(isLoading: true, errorMessage: '')),
    );

    final questionsResponse = await _getQuestionUseCase.call(examId);
    switch (questionsResponse) {
      case SuccessResponse<List<QuestionEntity>>():
        emit(
          state.copyWith(
            questions: BaseState(
              isLoading: false,
              data: questionsResponse.data,
            ),
            currentQuestionIndex: 0,
          ),
        );
        _startTimer(examTime);
      case ErrorResponse<List<QuestionEntity>>():
        emit(
          state.copyWith(
            questions: BaseState(
              isLoading: false,
              errorMessage: questionsResponse.errorMessage,
            ),
          ),
        );
    }
  }

  void _nextQuestion() {
    final questions = state.questions?.data ?? [];

    if (state.currentQuestionIndex < questions.length - 1) {
      emit(
        state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1),
      );
    }
  }

  void _previousQuestion() {
    if (state.currentQuestionIndex > 0) {
      emit(
        state.copyWith(currentQuestionIndex: state.currentQuestionIndex - 1),
      );
    }
  }

  void _selectAnswer({required String questionId, required String answerKey}) {
    final answers = Map<String, String>.from(state.selectedAnswers);

    answers[questionId] = answerKey;

    emit(state.copyWith(selectedAnswers: answers));
  }

  void _startTimer(int durationInMinutes) {
    _timer?.cancel();

    int seconds = durationInMinutes * 60;

    emit(state.copyWith(remainingSeconds: seconds, isExamFinished: false));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingSeconds <= 1) {
        timer.cancel();
        _onTimeOut();
        return;
      }

      emit(state.copyWith(remainingSeconds: state.remainingSeconds - 1));
    });
  }

  Future<void> _submitExam() async {
    emit(
      state.copyWith(
        submitExam: state.submitExam.copyWith(
          isLoading: true,
          errorMessage: '',
        ),
      ),
    );

    try {
      final questions = state.questions?.data ?? [];

      final totalQuestions = questions.length;

      final correctAnswers = _calculateCorrectAnswers(questions);
      final wrongAnswers = totalQuestions - correctAnswers;

      final ExamResultEntity result = ExamResultEntity(
        totalQuestions: totalQuestions,
        correctAnswers: correctAnswers,
        wrongAnswers: wrongAnswers,
        percentage: (correctAnswers / totalQuestions) * 100,
      );

      emit(
        state.copyWith(
          submitExam: state.submitExam.copyWith(isLoading: false, data: result),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          submitExam: state.submitExam.copyWith(
            isLoading: false,
            errorMessage: e.toString(),
          ),
        ),
      );
    }
  }

  int _calculateCorrectAnswers(List<QuestionEntity> questions) {
    int correct = 0;

    for (final question in questions) {
      final selected = state.selectedAnswers[question.id];

      if (selected == question.correct) {
        correct++;
      }
    }

    return correct;
  }

  Future<void> _onTimeOut() async {
    if (state.isExamFinished) return;

    emit(state.copyWith(remainingSeconds: 0, isExamFinished: true));

    await _submitExam();
  }
}
