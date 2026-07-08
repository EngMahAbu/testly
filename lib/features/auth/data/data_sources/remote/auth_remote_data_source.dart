import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/features/auth/data/models/signup_request.dart';
import 'package:testly/features/auth/data/models/signup_response.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<SignupResponse>> signup(SignupRequest signupRequest);
}