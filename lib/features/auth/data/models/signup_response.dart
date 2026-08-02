import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:testly/features/auth/data/models/user_model.dart';

part 'signup_response.g.dart';

SignupResponse signupResponseFromJson(String str) => SignupResponse.fromJson(json.decode(str));

String signupResponseToJson(SignupResponse data) => json.encode(data.toJson());

@JsonSerializable()
class SignupResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  UserModel? user;

  SignupResponse({
    this.message,
    this.token,
    this.user,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) => _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}
