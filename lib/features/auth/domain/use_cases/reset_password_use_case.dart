import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/auth/data/models/password_reset_request.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';
import 'package:testly/features/auth/domain/repositories/auth_repository.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepository _authRepository;

  ResetPasswordUseCase(this._authRepository);

  Future<BaseResponse<UserEntity>> call(
    PasswordResetRequest passwordResetRequest,
  ) async {
    // TODO: Mock endpoint success until endpoint is fixed
    return Future.delayed(Duration(seconds: 1), () {
      return SuccessResponse<UserEntity>(UserEntity());
    });
    // return await _authRepository.resetPassword(passwordResetRequest);
  }
}
