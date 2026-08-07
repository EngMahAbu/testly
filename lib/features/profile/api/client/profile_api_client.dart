import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:testly/core/constants/endpoints.dart';
import 'package:testly/features/profile/data/models/change_password_request.dart';
import 'package:testly/features/profile/data/models/edit_profile_request.dart';
import 'package:testly/features/profile/data/models/profile_response.dart';

part 'profile_api_client.g.dart';

@singleton
@RestApi()
abstract class ProfileApiClient {
  @factoryMethod
  factory ProfileApiClient(Dio dio) = _ProfileApiClient;

  @GET(Endpoints.profileData)
  Future<ProfileResponse> getProfileData();

  @PUT(Endpoints.editProfile)
  Future<ProfileResponse> editProfile(
      @Body() EditProfileRequest editProfileRequest);

  @PATCH(Endpoints.changePassword)
  Future<ProfileResponse> changePassword(
      @Body() ChangePasswordRequest changePasswordRequest);
}
