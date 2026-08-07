import 'package:json_annotation/json_annotation.dart';
import 'package:testly/features/auth/data/models/user_model.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "user")
  UserModel? user;

  ProfileResponse({this.message, this.user});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
