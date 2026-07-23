import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';

class ForgetPasswordState {
  BaseState<UserEntity>? passwordResetEmail;

  ForgetPasswordState({this.passwordResetEmail});

  ForgetPasswordState copyWith({BaseState<UserEntity>? passwordResetEmail}) {
    return ForgetPasswordState(
      passwordResetEmail: passwordResetEmail ?? this.passwordResetEmail,
    );
  }
}
