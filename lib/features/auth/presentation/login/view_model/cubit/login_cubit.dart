import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';

import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/auth/data/models/login_request.dart';
import 'package:testly/features/auth/domain/entities/login_entity.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';
import 'package:testly/features/auth/domain/use_cases/login_usecase.dart';
import 'package:testly/config/dio/token_service.dart';
import 'package:testly/features/auth/presentation/login/view_model/cubit/login_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  final TokenService _tokenService;

  LoginViewModel(this._loginUseCase, this._tokenService) : super(LoginState()) {
    state.login = BaseState<UserEntity>();
  }

  Future<void> login(LoginRequest loginRequest) async {
    emit(state.copyWith(login: BaseState<UserEntity>(isLoading: true)));

    final loginResponse = await _loginUseCase(loginRequest);

    switch (loginResponse) {
      case SuccessResponse<LoginEntity>():
        if (loginResponse.data != null) {
          // keep token in memory for current session; persist only if rememberMe
          _tokenService.setToken(
            loginResponse.data!.token,
            persist: state.rememberMe,
          );
        }

        emit(
          state.copyWith(
            login: BaseState<UserEntity>(
              isLoading: false,
              data: loginResponse.data?.user,
            ),
          ),
        );

      case ErrorResponse<LoginEntity>():
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

  void changeRememberMe(bool value) {
    emit(state.copyWith(rememberMe: value));
  }
}
