import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:testly/features/auth/data/models/signup_request.dart';
import 'package:testly/features/auth/data/models/signup_response.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';
import 'package:testly/features/auth/domain/repositories/auth_repository.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<BaseResponse<UserEntity>> signup(SignupRequest signupRequest) async {
    final response = await _authRemoteDataSource.signup(signupRequest);
    switch (response) {
      case SuccessResponse<SignupResponse>():
        return SuccessResponse<UserEntity>(response.data!.user!.toEntity());
      case ErrorResponse<SignupResponse>():
        return ErrorResponse<UserEntity>(response.error);
    }
  }
}
