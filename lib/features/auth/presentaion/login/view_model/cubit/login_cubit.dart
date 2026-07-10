import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
 
import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/auth/data/models/login_request.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';
import 'package:testly/features/auth/domain/use_cases/login_usecase.dart';
import 'package:testly/features/auth/presentaion/login/view_model/cubit/login_state.dart';


@injectable
class loginViewModel extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  loginViewModel(this._loginUseCase) : super(LoginState()) {
    state.login = BaseState<UserEntity>();
  }

  void login(LoginRequest loginRequest) async {
    emit(state.copyWith(login: BaseState<UserEntity>(isLoading: true)));
    final loginResponse = await _loginUseCase(loginRequest);
    switch (loginResponse) {
      case SuccessResponse<UserEntity>():
        emit(
          state.copyWith(
            login: BaseState<UserEntity>(
              isLoading: false,
              data: loginResponse.data,
            ),
          ),
        );
      case ErrorResponse<UserEntity>():
        emit(
          state.copyWith(
            login: BaseState<UserEntity>(
              isLoading: false,
              errorMessage: loginResponse.errorMessage,
            ),
          ),
        );
    }
  }

 
}