import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'password_reset_email_request.g.dart';

PasswordResetEmailRequest passwordResetEmailRequestFromJson(String str) =>
    PasswordResetEmailRequest.fromJson(json.decode(str));

String signupRequestToJson(PasswordResetEmailRequest data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PasswordResetEmailRequest {
  @JsonKey(name: "email")
  String? email;

  PasswordResetEmailRequest({this.email});

  factory PasswordResetEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetEmailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordResetEmailRequestToJson(this);
}
