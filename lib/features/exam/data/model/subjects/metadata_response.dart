import 'package:json_annotation/json_annotation.dart';

part 'metadata_response.g.dart';

 

@JsonSerializable()
class MetadataModel {
  @JsonKey(name: "currentPage")
  int? currentPage;

  @JsonKey(name: "numberOfPages")
  int? numberOfPages;

  @JsonKey(name: "limit")
  int? limit;

  MetadataModel({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory MetadataModel.fromJson(Map<String, dynamic> json) =>
      _$MetadataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataModelToJson(this);
}