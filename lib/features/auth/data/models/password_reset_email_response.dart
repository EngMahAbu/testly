import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:testly/features/auth/data/models/user_model.dart';

part 'password_reset_email_response.g.dart';

PasswordResetEmailResponse passwordResetEmailResponseFromJson(String str) =>
    PasswordResetEmailResponse.fromJson(json.decode(str));

String passwordResetEmailResponseToJson(PasswordResetEmailResponse data) =>
    json.encode(data.toJson());

// TODO: Modify this after endpoint is fixed
@JsonSerializable()
class PasswordResetEmailResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  UserModel? user;

  PasswordResetEmailResponse({this.message, this.token, this.user});

  factory PasswordResetEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetEmailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordResetEmailResponseToJson(this);
}
