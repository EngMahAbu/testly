import 'package:testly/features/exam/domain/entities/exam_entity.dart';

sealed class ExamEvents {}

class GetSubjects extends ExamEvents {}

class GetExams extends ExamEvents {
  final String subjectId;

  GetExams({required this.subjectId});
}

class GetQuestions extends ExamEvents {
  // final String examId;
  // final int examTime;
  final ExamEntity exam;
  GetQuestions({required this.exam});
}

class NextQuestion extends ExamEvents {}

class PreviousQuestion extends ExamEvents {}

class SubmitExam extends ExamEvents {}

class SelectAnswer extends ExamEvents {
  final String questionId;
  final String answerKey;

  SelectAnswer({required this.questionId, required this.answerKey});
}

class GetSavedExams extends ExamEvents {}

class GetSavedExam extends ExamEvents {
  final String examId;

  GetSavedExam(this.examId);
}
