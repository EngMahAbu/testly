import 'package:json_annotation/json_annotation.dart';

part 'exam_metadata_model.g.dart';

@JsonSerializable()
class ExamMetadataModel {
  final int currentPage;
  final int numberOfPages;
  final int limit;

  const ExamMetadataModel({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  factory ExamMetadataModel.fromJson(Map<String, dynamic> json) =>
      _$ExamMetadataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamMetadataModelToJson(this);
}