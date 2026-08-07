import 'package:testly/features/profile/data/models/edit_profile_request.dart';

sealed class ProfileEvent {}

class GetProfileDataEvent extends ProfileEvent {}

class EditProfileEvent extends ProfileEvent {
  final EditProfileRequest editProfileRequest;

  EditProfileEvent(this.editProfileRequest);
}

class ChangePasswordEvent extends ProfileEvent {
  final String oldPassword;
  final String password;
  final String rePassword;

  ChangePasswordEvent({
    required this.oldPassword,
    required this.password,
    required this.rePassword,
  });
}
