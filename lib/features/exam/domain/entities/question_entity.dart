import 'package:testly/features/exam/domain/entities/answer_entity.dart';
import 'package:testly/features/exam/domain/entities/exam_entity.dart';
import 'package:testly/features/exam/domain/entities/subject_entity.dart';

class QuestionEntity {
  final String id;
  final String question;
  final List<AnswerEntity> answers;
  final String type;
  final String correct;
  final SubjectEntity? subject;
  final ExamEntity? exam;
  final String createdAt;

  const QuestionEntity({
    required this.id,
    required this.question,
    required this.answers,
    required this.type,
    required this.correct,
    required this.subject,
    required this.exam,
    required this.createdAt,
  });
}