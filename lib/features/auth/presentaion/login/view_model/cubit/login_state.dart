import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';

class LoginState {
  BaseState<UserEntity>? login;
  bool rememberMe;

  LoginState({
    this.login,
    this.rememberMe = false,
  });

  LoginState copyWith({
    BaseState<UserEntity>? login,
    bool? rememberMe,
  }) {
    return LoginState(
      login: login ?? this.login,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }
}