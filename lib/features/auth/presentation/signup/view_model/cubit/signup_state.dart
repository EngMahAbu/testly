import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';

class SignupState {
  BaseState<UserEntity>? signup;

  SignupState({this.signup});

  SignupState copyWith({BaseState<UserEntity>? signup}) {
    return SignupState(signup: signup ?? this.signup);
  }
}
