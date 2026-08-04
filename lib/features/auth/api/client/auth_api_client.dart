import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:testly/core/constants/endpoints.dart';
import 'package:testly/features/auth/data/models/password_reset_email_request.dart';
import 'package:testly/features/auth/data/models/password_reset_email_response.dart';
import 'package:testly/features/auth/data/models/password_reset_request.dart';
import 'package:testly/features/auth/data/models/password_reset_response.dart';
import 'package:testly/features/auth/data/models/signup_request.dart';
import 'package:testly/features/auth/data/models/signup_response.dart';
import 'package:testly/features/auth/data/models/verify_reset_code_request.dart';
import 'package:testly/features/auth/data/models/verify_reset_code_response.dart';

part 'auth_api_client.g.dart';

@singleton
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(Endpoints.forgetPassword)
  Future<PasswordResetEmailResponse> sendPasswordResetEmail(
    @Body() PasswordResetEmailRequest passwordResetEmailRequest,
  );

  @POST(Endpoints.verifyResetCode)
  Future<VerifyResetCodeResponse> verifyResetCode(
    @Body() VerifyResetCodeRequest verifyResetCodeRequest,
  );

  @PUT(Endpoints.resetPassword)
  Future<PasswordResetResponse> resetPassword(
    @Body() PasswordResetRequest passwordResetRequest,
  );
}
