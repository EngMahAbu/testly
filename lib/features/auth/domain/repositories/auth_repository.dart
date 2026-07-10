import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/auth/data/models/login_request.dart';
import 'package:testly/features/auth/domain/entities/login_entity.dart';

abstract class AuthRepository {
  Future<BaseResponse<LoginEntity>> login(
    LoginRequest request,
  );
 

  Future<void> saveToken(String token);

  Future<String?> getToken();

  Future<void> deleteToken();
 

}