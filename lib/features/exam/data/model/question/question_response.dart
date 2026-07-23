import 'package:json_annotation/json_annotation.dart';

import 'question_model.dart';

part 'question_response.g.dart';

@JsonSerializable()
class QuestionResponse {
  final String message;
  final List<QuestionModel> questions;

  const QuestionResponse({required this.message, required this.questions});

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResponseToJson(this);
}
