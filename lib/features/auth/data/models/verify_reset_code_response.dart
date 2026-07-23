import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:testly/features/auth/data/models/user_model.dart';

part 'verify_reset_code_response.g.dart';

VerifyResetCodeResponse verifyResetCodeResponseFromJson(String str) =>
    VerifyResetCodeResponse.fromJson(json.decode(str));

String verifyResetCodeResponseToJson(VerifyResetCodeResponse data) =>
    json.encode(data.toJson());

// TODO: Modify this after endpoint is fixed
@JsonSerializable()
class VerifyResetCodeResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  UserModel? user;

  VerifyResetCodeResponse({this.message, this.token, this.user});

  factory VerifyResetCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetCodeResponseToJson(this);
}
