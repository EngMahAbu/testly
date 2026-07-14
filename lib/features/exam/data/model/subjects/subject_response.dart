import 'package:json_annotation/json_annotation.dart';

part 'subject_response.g.dart';

@JsonSerializable()
class SubjectResponse {
  @JsonKey(name: '_id')
  final String id;

  final String name;
  final String icon;
  final DateTime createdAt;

  SubjectResponse({
    required this.id,
    required this.name,
    required this.icon,
    required this.createdAt,
  });

  factory SubjectResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectResponseToJson(this);
}