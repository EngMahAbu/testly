import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
 
import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/auth/data/models/login_request.dart';
import 'package:testly/features/auth/domain/entities/login_entity.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';
import 'package:testly/features/auth/domain/use_cases/login_usecase.dart';
import 'package:testly/features/auth/domain/use_cases/token_usecases/token_usecases.dart';
import 'package:testly/features/auth/presentation/login/view_model/cubit/login_state.dart';


@injectable
class LoginViewModel extends Cubit<LoginState> {
final LoginUseCase _loginUseCase;
final SaveTokenUseCase _saveTokenUseCase;
final DeleteTokenUseCase _deleteTokenUseCase;

LoginViewModel(
  this._loginUseCase,
  this._saveTokenUseCase,
  this._deleteTokenUseCase,
) : super(LoginState()) {
  state.login = BaseState<UserEntity>();
}
  

  Future<void> login(LoginRequest loginRequest) async {
    emit(state.copyWith(login: BaseState<UserEntity>(isLoading: true)));

    final loginResponse = await _loginUseCase(loginRequest);

    switch (loginResponse) {
      case SuccessResponse<LoginEntity>():
        if (state.rememberMe && loginResponse.data != null) {
          await _saveTokenUseCase(loginResponse.data!.token);
        } else {
          await _deleteTokenUseCase();
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
  emit(
    state.copyWith(
      rememberMe: value,
    ),
  );
}
 
}