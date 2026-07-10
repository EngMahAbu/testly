import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';

class LoginState {
  BaseState<UserEntity>? login;

  LoginState({this.login});

  LoginState copyWith({BaseState<UserEntity>? login}) {
    return LoginState(login: login ?? this.login);
  }
}