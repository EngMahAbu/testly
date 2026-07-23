import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/auth/data/models/password_reset_email_request.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';
import 'package:testly/features/auth/domain/use_cases/send_password_reset_email_use_case.dart';
import 'package:testly/features/auth/presentation/forget_password/view_model/cubit/forget_password_state.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  final SendPasswordResetEmailUseCase _sendPasswordResetEmailUseCase;

  ForgetPasswordViewModel(this._sendPasswordResetEmailUseCase)
    : super(ForgetPasswordState(passwordResetEmail: BaseState<UserEntity>()));

  void sendResetCodeEmail(String email) async {
    emit(
      state.copyWith(
        passwordResetEmail: BaseState<UserEntity>(isLoading: true),
      ),
    );
    final passwordResetEmailResponse = await _sendPasswordResetEmailUseCase(
      PasswordResetEmailRequest(email: email),
    );
    switch (passwordResetEmailResponse) {
      case SuccessResponse<UserEntity>():
        emit(
          state.copyWith(
            passwordResetEmail: BaseState<UserEntity>(
              isLoading: false,
              data: passwordResetEmailResponse.data,
            ),
          ),
        );
      case ErrorResponse<UserEntity>():
        emit(
          state.copyWith(
            passwordResetEmail: BaseState<UserEntity>(
              isLoading: false,
              errorMessage: passwordResetEmailResponse.errorMessage,
            ),
          ),
        );
    }
  }
}
