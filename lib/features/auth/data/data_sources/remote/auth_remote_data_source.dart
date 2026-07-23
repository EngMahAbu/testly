import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/auth/data/models/login_request.dart';
import 'package:testly/features/auth/data/models/login_response.dart';
import 'package:testly/features/auth/data/models/password_reset_email_request.dart';
import 'package:testly/features/auth/data/models/password_reset_email_response.dart';
import 'package:testly/features/auth/data/models/password_reset_request.dart';
import 'package:testly/features/auth/data/models/password_reset_response.dart';
import 'package:testly/features/auth/data/models/signup_request.dart';
import 'package:testly/features/auth/data/models/signup_response.dart';
import 'package:testly/features/auth/data/models/verify_reset_code_request.dart';
import 'package:testly/features/auth/data/models/verify_reset_code_response.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<LoginResponse>> login(LoginRequest request);

  Future<BaseResponse<SignupResponse>> signup(SignupRequest signupRequest);

  Future<BaseResponse<PasswordResetEmailResponse>> sendPasswordResetEmail(
    PasswordResetEmailRequest passwordResetEmailRequest,
  );

  Future<BaseResponse<VerifyResetCodeResponse>> verifyResetCode(
    VerifyResetCodeRequest verifyResetCodeRequest,
  );

  Future<BaseResponse<PasswordResetResponse>> resetPassword(
    PasswordResetRequest passwordResetRequest,
  );
}
