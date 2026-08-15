// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectResponse _$SubjectResponseFromJson(Map<String, dynamic> json) =>
    SubjectResponse(
      id: json['_id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$SubjectResponseToJson(SubjectResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'createdAt': instance.createdAt.toIso8601String(),
    };
