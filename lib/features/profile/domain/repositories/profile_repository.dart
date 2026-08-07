import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';
import 'package:testly/features/profile/data/models/change_password_request.dart';
import 'package:testly/features/profile/data/models/edit_profile_request.dart';

abstract class ProfileRepository {
  Future<BaseResponse<UserEntity>> getProfileData();

  Future<BaseResponse<UserEntity>> editProfile(
    EditProfileRequest editProfileRequest,
  );

  Future<BaseResponse<UserEntity>> changePassword(
    ChangePasswordRequest changePasswordRequest,
  );
}
