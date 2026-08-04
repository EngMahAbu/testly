import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';

class ForgetPasswordState {
  BaseState<UserEntity>? passwordResetEmail;
  BaseState<UserEntity>? verifyResetCode;

  ForgetPasswordState({this.passwordResetEmail, this.verifyResetCode});

  ForgetPasswordState copyWith({
    BaseState<UserEntity>? passwordResetEmail,
    BaseState<UserEntity>? verifyResetCode,
  }) {
    return ForgetPasswordState(
      passwordResetEmail: passwordResetEmail ?? this.passwordResetEmail,
      verifyResetCode: verifyResetCode ?? this.verifyResetCode,
    );
  }
}
