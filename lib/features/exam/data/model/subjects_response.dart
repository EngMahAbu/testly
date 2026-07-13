import 'package:json_annotation/json_annotation.dart';
import 'package:testly/features/exam/data/model/metadata_response.dart';
import 'package:testly/features/exam/data/model/subject_model.dart';

part 'subjects_response.g.dart';


@JsonSerializable()
class SubjectsResponse {
  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "metadata")
  MetadataModel? metadata;

  @JsonKey(name: "subjects")
  List<SubjectModel>? subjects;

  SubjectsResponse({
    this.message,
    this.metadata,
    this.subjects,
  });

  factory SubjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectsResponseToJson(this);
}