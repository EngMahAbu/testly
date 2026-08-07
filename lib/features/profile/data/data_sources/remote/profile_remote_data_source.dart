import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/profile/data/models/change_password_request.dart';
import 'package:testly/features/profile/data/models/edit_profile_request.dart';
import 'package:testly/features/profile/data/models/profile_response.dart';

abstract class ProfileRemoteDataSource {
  Future<BaseResponse<ProfileResponse>> getProfileData();

  Future<BaseResponse<ProfileResponse>> editProfile(
    EditProfileRequest editProfileRequest,
  );

  Future<BaseResponse<ProfileResponse>> changePassword(
    ChangePasswordRequest changePasswordRequest,
  );
}
