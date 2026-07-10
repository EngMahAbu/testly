import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/auth/data/models/login_request.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart' show UserEntity;

abstract class AuthRepository {
  Future<BaseResponse<UserEntity>> login(
    LoginRequest request,
  );
}