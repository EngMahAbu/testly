// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_email_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordResetEmailResponse _$PasswordResetEmailResponseFromJson(
  Map<String, dynamic> json,
) => PasswordResetEmailResponse(
  message: json['message'] as String?,
  token: json['token'] as String?,
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PasswordResetEmailResponseToJson(
  PasswordResetEmailResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'token': instance.token,
  'user': instance.user,
};
