// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_reset_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyResetCodeResponse _$VerifyResetCodeResponseFromJson(
  Map<String, dynamic> json,
) => VerifyResetCodeResponse(
  message: json['message'] as String?,
  token: json['token'] as String?,
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VerifyResetCodeResponseToJson(
  VerifyResetCodeResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'token': instance.token,
  'user': instance.user,
};
