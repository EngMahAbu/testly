import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:testly/features/auth/data/models/login_request.dart';
import 'package:testly/features/auth/data/models/login_response.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';
import 'package:testly/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {

  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
Future<BaseResponse<UserEntity>> login(
    LoginRequest request) async {
   final response = await _authRemoteDataSource.login(request);
 switch (response) {
    
   case SuccessResponse<LoginResponse>():
          return SuccessResponse<UserEntity>(response.data!.user.toEntity());
   case ErrorResponse<LoginResponse>():
 return ErrorResponse<UserEntity>(response.errorMessage);
 }
}
}