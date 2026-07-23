import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'password_reset_request.g.dart';

PasswordResetRequest passwordResetRequestFromJson(String str) =>
    PasswordResetRequest.fromJson(json.decode(str));

// TODO: Fix this when endpoint is fixed
String passwordResetRequestToJson(PasswordResetRequest data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PasswordResetRequest {
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "newPassword")
  String newPassword;

  PasswordResetRequest({required this.email, required this.newPassword});

  factory PasswordResetRequest.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordResetRequestToJson(this);
}
