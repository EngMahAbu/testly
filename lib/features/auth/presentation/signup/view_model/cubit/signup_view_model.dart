import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/auth/data/models/signup_request.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';
import 'package:testly/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:testly/features/auth/presentation/signup/view_model/cubit/signup_state.dart';

@injectable
class SignupViewModel extends Cubit<SignupState> {
  final SignupUseCase _signupUseCase;

  SignupViewModel(this._signupUseCase) : super(SignupState()) {
    state.signup = BaseState<UserEntity>();
  }

  void signup(SignupRequest signupRequest) async {
    emit(state.copyWith(signup: BaseState<UserEntity>(isLoading: true)));
    final signupResponse = await _signupUseCase(signupRequest);
    switch (signupResponse) {
      case SuccessResponse<UserEntity>():
        emit(
          state.copyWith(
            signup: BaseState<UserEntity>(
              isLoading: false,
              data: signupResponse.data,
            ),
          ),
        );
      case ErrorResponse<UserEntity>():
        emit(
          state.copyWith(
            signup: BaseState<UserEntity>(
              isLoading: false,
              errorMessage: signupResponse.errorMessage,
            ),
          ),
        );
    }
  }
}
