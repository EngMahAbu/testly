import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/auth/data/models/password_reset_email_request.dart';
import 'package:testly/features/auth/data/models/verify_reset_code_request.dart';

abstract class AuthRepository {
  Future<BaseResponse<UserEntity>> sendPasswordResetEmail(
    PasswordResetEmailRequest passwordResetEmailRequest,
  );

  Future<BaseResponse<UserEntity>> verifyResetCode(
    VerifyResetCodeRequest verifyResetCodeRequest,
  );
}
