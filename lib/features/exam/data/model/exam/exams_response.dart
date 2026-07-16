import 'package:json_annotation/json_annotation.dart';
import 'package:testly/features/exam/data/model/subjects/metadata_response.dart';
import 'exam_model.dart';
 

part 'exams_response.g.dart';

@JsonSerializable()
class ExamsResponse {
  final String message;
  final MetadataModel metadata;
  final List<ExamModel> exams;

  const ExamsResponse({
    required this.message,
    required this.metadata,
    required this.exams,
  });

  factory ExamsResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamsResponseToJson(this);
}