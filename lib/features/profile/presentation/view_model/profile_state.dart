import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';
import 'package:testly/features/profile/data/models/edit_profile_request.dart';

class ProfileState {
  final BaseState<UserEntity> profileData;
  final BaseState<UserEntity> updateProfile;
  final EditProfileRequest? currentProfileInfo;
  final BaseState<UserEntity> changePassword;

  ProfileState({
    required this.profileData,
    required this.updateProfile,
    required this.changePassword,
    this.currentProfileInfo,
  });

  factory ProfileState.initial() => ProfileState(
    profileData: BaseState<UserEntity>(),
    updateProfile: BaseState<UserEntity>(),
    changePassword: BaseState<UserEntity>(),
  );

  ProfileState copyWith({
    BaseState<UserEntity>? profileData,
    BaseState<UserEntity>? updateProfile,
    BaseState<UserEntity>? changePassword,
    EditProfileRequest? currentProfileInfo,
  }) {
    return ProfileState(
      profileData: profileData ?? this.profileData,
      updateProfile: updateProfile ?? this.updateProfile,
      changePassword: changePassword ?? this.changePassword,
      currentProfileInfo: currentProfileInfo ?? this.currentProfileInfo,
    );
  }
}
