import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_request.g.dart';

VerifyResetCodeRequest verifyResetCodeRequestFromJson(String str) =>
    VerifyResetCodeRequest.fromJson(json.decode(str));

String verifyResetCodeRequestToJson(VerifyResetCodeRequest data) =>
    json.encode(data.toJson());

@JsonSerializable()
class VerifyResetCodeRequest {
  @JsonKey(name: "resetCode")
  String? resetCode;

  VerifyResetCodeRequest({this.resetCode});

  factory VerifyResetCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetCodeRequestToJson(this);
}
