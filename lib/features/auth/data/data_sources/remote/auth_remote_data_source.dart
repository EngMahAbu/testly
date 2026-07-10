import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/auth/data/models/login_request.dart';
import 'package:testly/features/auth/data/models/login_response.dart';

abstract class AuthRemoteDataSource {

  Future<BaseResponse<LoginResponse>> login(
      LoginRequest request);

}