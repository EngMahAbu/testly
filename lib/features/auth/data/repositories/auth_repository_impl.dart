import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
 
import 'package:testly/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:testly/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:testly/features/auth/data/models/login_request.dart';
import 'package:testly/features/auth/data/models/login_response.dart';
import 'package:testly/features/auth/domain/entities/login_entity.dart';
import 'package:testly/features/auth/domain/repositories/auth_repository.dart';
import 'package:testly/features/auth/data/models/signup_request.dart';
import 'package:testly/features/auth/data/models/signup_response.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';
@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {

  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource, this._authLocalDataSource);
  @override
  Future<BaseResponse<UserEntity>> signup(SignupRequest signupRequest) async {
    final response = await _authRemoteDataSource.signup(signupRequest);
    switch (response) {
      case SuccessResponse<SignupResponse>():
        return SuccessResponse<UserEntity>(response.data!.user!.toEntity());
      case ErrorResponse<SignupResponse>():
        return ErrorResponse<UserEntity>(response.errorMessage);
    }
  }
  @override
Future<BaseResponse<LoginEntity>> login(
    LoginRequest request) async {
   final response = await _authRemoteDataSource.login(request);
 switch (response) {
   case SuccessResponse<LoginResponse>():
     final loginData = response.data;
     if (loginData == null) {
       return ErrorResponse<LoginEntity>('Login response is empty');
     }

     return SuccessResponse<LoginEntity>(
       LoginEntity(
         token: loginData.token,
         user: loginData.user.toEntity(),
       ),
     );

   case ErrorResponse<LoginResponse>():
     return ErrorResponse<LoginEntity>(response.errorMessage);
 }
}

@override
Future<void> saveToken(String token) {
  return _authLocalDataSource.saveToken(token);
}

@override
Future<String?> getToken() {
  return _authLocalDataSource.getToken();
}

@override
Future<void> deleteToken() {
  return _authLocalDataSource.deleteToken();
}
}

