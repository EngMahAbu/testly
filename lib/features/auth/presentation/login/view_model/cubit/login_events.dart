import 'package:testly/features/auth/data/models/login_request.dart';

sealed class LoginEvents {}

class LoginSucces extends LoginEvents {
  final LoginRequest loginRequest;

  LoginSucces({required this.loginRequest});
}
