import 'package:testly/config/base_response/base_response.dart';

import 'package:testly/features/auth/data/models/login_request.dart';
import 'package:testly/features/auth/domain/entities/login_entity.dart';
import 'package:testly/features/auth/data/models/password_reset_email_request.dart';
import 'package:testly/features/auth/data/models/signup_request.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<BaseResponse<LoginEntity>> login(LoginRequest request);
  Future<BaseResponse<UserEntity>> signup(SignupRequest signupRequest);

  Future<BaseResponse<UserEntity>> sendPasswordResetEmail(
    PasswordResetEmailRequest passwordResetEmailRequest,
  );
}
