import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/auth/data/models/verify_reset_code_request.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';
import 'package:testly/features/auth/domain/repositories/auth_repository.dart';

@injectable
class VerifyResetCodeUseCase {
  final AuthRepository _authRepository;

  VerifyResetCodeUseCase(this._authRepository);

  Future<BaseResponse<UserEntity>> call(
    VerifyResetCodeRequest verifyResetCodeRequest,
  ) async {
    // TODO: Mock endpoint success until endpoint is fixed
    return Future.delayed(Duration(seconds: 1), () {
      return SuccessResponse<UserEntity>(UserEntity());
    });
    // return await _authRepository.verifyResetCode(verifyResetCodeRequest);
  }
}
