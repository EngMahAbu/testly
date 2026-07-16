import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/auth/data/models/password_reset_email_request.dart';
import 'package:testly/features/auth/data/models/password_reset_request.dart';
import 'package:testly/features/auth/data/models/signup_request.dart';
import 'package:testly/features/auth/data/models/verify_reset_code_request.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<BaseResponse<UserEntity>> signup(SignupRequest signupRequest);

  Future<BaseResponse<UserEntity>> sendPasswordResetEmail(
    PasswordResetEmailRequest passwordResetEmailRequest,
  );

  Future<BaseResponse<UserEntity>> verifyResetCode(
    VerifyResetCodeRequest verifyResetCodeRequest,
  );

  Future<BaseResponse<UserEntity>> resetPassword(
    PasswordResetRequest passwordResetRequest,
  );
}
