import 'package:injectable/injectable.dart';
import 'package:testly/config/api_error_handler/api_error_handler.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/auth/api/client/auth_api_client.dart';
import 'package:testly/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:testly/features/auth/data/models/login_request.dart';
import 'package:testly/features/auth/data/models/login_response.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiClient api;

  AuthRemoteDataSourceImpl(this.api);

  @override
  Future<BaseResponse<LoginResponse>> login(LoginRequest request) async {
    try {
      final response =await api.login(request);
      return SuccessResponse< LoginResponse>(response);
    }  on Exception catch (e) {
      return ApiErrorHandler.handleException(e);
    }
  }
}
import 'package:injectable/injectable.dart';
import 'package:testly/config/api_error_handler/api_error_handler.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/auth/api/client/auth_api_client.dart';
import 'package:testly/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:testly/features/auth/data/models/signup_request.dart';
import 'package:testly/features/auth/data/models/signup_response.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiClient _authApiClient;

  AuthRemoteDataSourceImpl(this._authApiClient);

  @override
  Future<BaseResponse<SignupResponse>> signup(
    SignupRequest signupRequest,
  ) async {
    try {
      final signupResponse = await _authApiClient.signup(signupRequest);
      return SuccessResponse<SignupResponse>(signupResponse);
    } on Exception catch (e) {
      return ApiErrorHandler.handleException(e);
    }
  }
}
