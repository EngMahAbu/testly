import 'package:json_annotation/json_annotation.dart';
import 'package:testly/features/exam/domain/entities/subject_entity.dart';

part 'subject_model.g.dart';

 @JsonSerializable()
class SubjectModel {
  @JsonKey(name: "_id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "icon")
  String? icon;

  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  SubjectModel({
    this.id,
    this.name,
    this.icon,
    this.createdAt,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);

  SubjectEntity toEntity() => SubjectEntity(
        id: id,
        name: name,
        icon: icon,
        createdAt: createdAt,
      );
}