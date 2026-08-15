import 'package:json_annotation/json_annotation.dart';
import 'package:testly/features/exam/data/model/exam/exam_model.dart';
import 'package:testly/features/exam/data/model/subjects/subject_model.dart';
import 'package:testly/features/exam/domain/entities/question_entity.dart';

import 'answer_model.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
  @JsonKey(name: '_id')
  final String id;

  final String question;
  final List<AnswerModel> answers;
  final String type;
  final String correct;

  final SubjectModel? subject;
  final ExamModel? exam;

  final String createdAt;

  const QuestionModel({
    required this.id,
    required this.question,
    required this.answers,
    required this.type,
    required this.correct,
    this.subject,
    this.exam,
    required this.createdAt,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);

  QuestionEntity toEntity() {
    return QuestionEntity(
      id: id,
      question: question,
      answers: answers.map((e) => e.toEntity()).toList(),
      type: type,
      correct: correct,
      subject: subject?.toEntity(),
      exam: exam?.toEntity(),
      createdAt: createdAt,
    );
  }
}
