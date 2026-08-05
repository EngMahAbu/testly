import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:testly/features/auth/data/models/user_model.dart';

part 'password_reset_response.g.dart';

PasswordResetResponse passwordResetResponseFromJson(String str) =>
    PasswordResetResponse.fromJson(json.decode(str));

String passwordResetResponseToJson(PasswordResetResponse data) =>
    json.encode(data.toJson());

// TODO: Modify this after endpoint is fixed
@JsonSerializable()
class PasswordResetResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  UserModel? user;

  PasswordResetResponse({this.message, this.token, this.user});

  factory PasswordResetResponse.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordResetResponseToJson(this);
}
