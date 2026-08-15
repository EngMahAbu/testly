import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';
import 'package:testly/features/profile/data/data_sources/remote/profile_remote_data_source.dart';
import 'package:testly/features/profile/data/models/change_password_request.dart';
import 'package:testly/features/profile/data/models/edit_profile_request.dart';
import 'package:testly/features/profile/data/models/profile_response.dart';
import 'package:testly/features/profile/domain/repositories/profile_repository.dart';

@Singleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepositoryImpl(this._profileRemoteDataSource);

  @override
  Future<BaseResponse<UserEntity>> getProfileData() async {
    final response = await _profileRemoteDataSource.getProfileData();
    switch (response) {
      case SuccessResponse<ProfileResponse>():
        return SuccessResponse<UserEntity>(response.data?.user?.toEntity());
      case ErrorResponse<ProfileResponse>():
        return ErrorResponse<UserEntity>(response.errorMessage);
    }
  }

  @override
  Future<BaseResponse<UserEntity>> editProfile(
    EditProfileRequest editProfileRequest,
  ) async {
    final response = await _profileRemoteDataSource.editProfile(
      editProfileRequest,
    );
    switch (response) {
      case SuccessResponse<ProfileResponse>():
        return SuccessResponse<UserEntity>(response.data?.user?.toEntity());
      case ErrorResponse<ProfileResponse>():
        return ErrorResponse<UserEntity>(response.errorMessage);
    }
  }

  @override
  Future<BaseResponse<UserEntity>> changePassword(
    ChangePasswordRequest changePasswordRequest,
  ) async {
    final response = await _profileRemoteDataSource.changePassword(
      changePasswordRequest,
    );
    switch (response) {
      case SuccessResponse<ProfileResponse>():
        return SuccessResponse<UserEntity>(response.data?.user?.toEntity());
      case ErrorResponse<ProfileResponse>():
        return ErrorResponse<UserEntity>(response.errorMessage);
    }
  }
}
