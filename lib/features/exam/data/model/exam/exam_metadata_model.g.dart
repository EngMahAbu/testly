// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_metadata_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamMetadataModel _$ExamMetadataModelFromJson(Map<String, dynamic> json) =>
    ExamMetadataModel(
      currentPage: (json['currentPage'] as num).toInt(),
      numberOfPages: (json['numberOfPages'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$ExamMetadataModelToJson(ExamMetadataModel instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
    };
