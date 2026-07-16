import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/auth/data/models/password_reset_email_request.dart';
import 'package:testly/features/auth/data/models/password_reset_request.dart';
import 'package:testly/features/auth/data/models/verify_reset_code_request.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';
import 'package:testly/features/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:testly/features/auth/domain/use_cases/send_password_reset_email_use_case.dart';
import 'package:testly/features/auth/domain/use_cases/verify_reset_code_use_case.dart';
import 'package:testly/features/auth/presentation/forget_password/view_model/cubit/forget_password_state.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  final SendPasswordResetEmailUseCase _sendPasswordResetEmailUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  bool isVerificationCodeDialogShown = false;

  ForgetPasswordViewModel(
    this._sendPasswordResetEmailUseCase,
    this._verifyResetCodeUseCase,
    this._resetPasswordUseCase,
  ) : super(
        ForgetPasswordState(
          screenSection: EmailSendSection(),
          passwordResetEmail: BaseState<UserEntity>(),
          verifyResetCode: BaseState<UserEntity>(),
          resetPassword: BaseState<UserEntity>(),
        ),
      );

  // TODO: remove this when user management is handled
  final String userEmail = '';

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
            screenSection: VerificationCodeSection(),
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

  void verifyResetCode(String resetCode) async {
    emit(
      state.copyWith(verifyResetCode: BaseState<UserEntity>(isLoading: true)),
    );
    final verifyResetCodeResponse = await _verifyResetCodeUseCase(
      VerifyResetCodeRequest(resetCode: resetCode),
    );
    switch (verifyResetCodeResponse) {
      case SuccessResponse<UserEntity>():
        emit(
          state.copyWith(
            screenSection: PasswordResetSection(),
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

  void resetPassword(String newPassword) async {
    emit(state.copyWith(resetPassword: BaseState<UserEntity>(isLoading: true)));
    final resetPasswordResponse = await _resetPasswordUseCase(
      PasswordResetRequest(email: userEmail, newPassword: newPassword),
    );
    switch (resetPasswordResponse) {
      case SuccessResponse<UserEntity>():
        emit(
          state.copyWith(
            screenSection: PasswordResetSection(),
            resetPassword: BaseState<UserEntity>(
              isLoading: false,
              data: resetPasswordResponse.data,
            ),
          ),
        );
      case ErrorResponse<UserEntity>():
        emit(
          state.copyWith(
            resetPassword: BaseState<UserEntity>(
              isLoading: false,
              errorMessage: resetPasswordResponse.errorMessage,
            ),
          ),
        );
    }
  }

  void toggleVerificationCodeDialog(bool isShown) {
    isVerificationCodeDialogShown = isShown;
  }
}
