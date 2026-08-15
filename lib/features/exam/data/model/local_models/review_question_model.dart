import 'package:json_annotation/json_annotation.dart';
 part 'review_question_model.g.dart';   
@JsonSerializable()
class ReviewQuestionModel {

  final String questionId;

  final String question;

  final List<String> choices;

  final String correctAnswer;

  final String? selectedAnswer;

  ReviewQuestionModel({

    required this.questionId,

    required this.question,

    required this.choices,

    required this.correctAnswer,

    this.selectedAnswer,
  });

  factory ReviewQuestionModel.fromJson(
      Map<String,dynamic> json)
      =>
      _$ReviewQuestionModelFromJson(json);

  Map<String,dynamic> toJson()
      =>
      _$ReviewQuestionModelToJson(this);
}