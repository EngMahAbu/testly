import 'package:injectable/injectable.dart';
import 'package:testly/config/api_error_handler/api_error_handler.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/profile/api/client/profile_api_client.dart';
import 'package:testly/features/profile/data/data_sources/remote/profile_remote_data_source.dart';
import 'package:testly/features/profile/data/models/change_password_request.dart';
import 'package:testly/features/profile/data/models/edit_profile_request.dart';
import 'package:testly/features/profile/data/models/profile_response.dart';

@Singleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileApiClient _profileApiClient;

  ProfileRemoteDataSourceImpl(this._profileApiClient);

  @override
  Future<BaseResponse<ProfileResponse>> getProfileData() async {
    try {
      final response = await _profileApiClient.getProfileData();
      return SuccessResponse<ProfileResponse>(response);
    } on Exception catch (e) {
      return ApiErrorHandler.handleException<ProfileResponse>(e);
    }
  }

  @override
  Future<BaseResponse<ProfileResponse>> editProfile(
    EditProfileRequest editProfileRequest,
  ) async {
    try {
      final response = await _profileApiClient.editProfile(editProfileRequest);
      return SuccessResponse<ProfileResponse>(response);
    } on Exception catch (e) {
      return ApiErrorHandler.handleException<ProfileResponse>(e);
    }
  }

  @override
  Future<BaseResponse<ProfileResponse>> changePassword(
    ChangePasswordRequest changePasswordRequest,
  ) async {
    try {
      final response = await _profileApiClient.changePassword(
        changePasswordRequest,
      );
      return SuccessResponse<ProfileResponse>(response);
    } on Exception catch (e) {
      return ApiErrorHandler.handleException<ProfileResponse>(e);
    }
  }
}
