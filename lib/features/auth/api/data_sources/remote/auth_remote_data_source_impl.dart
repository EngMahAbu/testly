import 'package:injectable/injectable.dart';
import 'package:testly/config/api_error_handler/api_error_handler.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/auth/api/client/auth_api_client.dart';
import 'package:testly/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:testly/features/auth/data/models/password_reset_email_request.dart';
import 'package:testly/features/auth/data/models/password_reset_email_response.dart';
import 'package:testly/features/auth/data/models/password_reset_request.dart';
import 'package:testly/features/auth/data/models/password_reset_response.dart';
import 'package:testly/features/auth/data/models/signup_request.dart';
import 'package:testly/features/auth/data/models/signup_response.dart';
import 'package:testly/features/auth/data/models/verify_reset_code_request.dart';
import 'package:testly/features/auth/data/models/verify_reset_code_response.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiClient _authApiClient;

  AuthRemoteDataSourceImpl(this._authApiClient);

  @override
  Future<BaseResponse<PasswordResetEmailResponse>> sendPasswordResetEmail(
    PasswordResetEmailRequest passwordResetEmailRequest,
  ) async {
    try {
      final passwordResetEmailResponse = await _authApiClient
          .sendPasswordResetEmail(passwordResetEmailRequest);
      return SuccessResponse<PasswordResetEmailResponse>(
        passwordResetEmailResponse,
      );
    } on Exception catch (e) {
      return ApiErrorHandler.handleException<PasswordResetEmailResponse>(e);
    }
  }

  @override
  Future<BaseResponse<VerifyResetCodeResponse>> verifyResetCode(
    VerifyResetCodeRequest verifyResetCodeRequest,
  ) async {
    try {
      final verifyResetCodeResponse = await _authApiClient.verifyResetCode(
        verifyResetCodeRequest,
      );
      return SuccessResponse<VerifyResetCodeResponse>(verifyResetCodeResponse);
    } on Exception catch (e) {
      return ApiErrorHandler.handleException<VerifyResetCodeResponse>(e);
    }
  }

  @override
  Future<BaseResponse<PasswordResetResponse>> resetPassword(
    PasswordResetRequest passwordResetRequest,
  ) async {
    try {
      final passwordResetResponse = await _authApiClient.resetPassword(
        passwordResetRequest,
      );
      return SuccessResponse<PasswordResetResponse>(passwordResetResponse);
    } on Exception catch (e) {
      return ApiErrorHandler.handleException<PasswordResetResponse>(e);
    }
  }
}
