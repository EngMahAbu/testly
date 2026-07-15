import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/auth/data/models/password_reset_email_request.dart';
import 'package:testly/features/auth/data/models/verify_reset_code_request.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';
import 'package:testly/features/auth/domain/use_cases/send_password_reset_email_use_case.dart';
import 'package:testly/features/auth/domain/use_cases/verify_reset_code_use_case.dart';
import 'package:testly/features/auth/presentation/forget_password/view_model/cubit/forget_password_state.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  final SendPasswordResetEmailUseCase _sendPasswordResetEmailUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;

  ForgetPasswordViewModel(
    this._sendPasswordResetEmailUseCase,
    this._verifyResetCodeUseCase,
  ) : super(
        ForgetPasswordState(
          passwordResetEmail: BaseState<UserEntity>(),
          // verifyResetCode: BaseState<UserEntity>(),
        ),
      );

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
        emit(state.copyWith(verifyResetCode: BaseState<UserEntity>()));
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

  void verifyResetCode(String resetCode) async {
    emit(
      state.copyWith(
        passwordResetEmail: BaseState<UserEntity>(),
        verifyResetCode: BaseState<UserEntity>(isLoading: true),
      ),
    );
    final verifyResetCodeResponse = await _verifyResetCodeUseCase(
      VerifyResetCodeRequest(resetCode: resetCode),
    );
    switch (verifyResetCodeResponse) {
      case SuccessResponse<UserEntity>():
        emit(
          state.copyWith(
            verifyResetCode: BaseState<UserEntity>(
              isLoading: false,
              data: verifyResetCodeResponse.data,
            ),
          ),
        );
      case ErrorResponse<UserEntity>():
        emit(
          state.copyWith(
            verifyResetCode: BaseState<UserEntity>(
              isLoading: false,
              errorMessage: verifyResetCodeResponse.errorMessage,
            ),
          ),
        );
    }
  }
}
