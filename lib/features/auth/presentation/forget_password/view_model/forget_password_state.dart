import 'package:testly/config/base_state/base_state.dart';
import 'package:testly/features/auth/domain/entities/user_entity.dart';

class ForgetPasswordState {
  ForgetPasswordScreenSection screenSection;
  BaseState<UserEntity>? passwordResetEmail;
  BaseState<UserEntity>? verifyResetCode;
  BaseState<UserEntity>? resetPassword;

  ForgetPasswordState({
    ForgetPasswordScreenSection? screenSection,
    this.passwordResetEmail,
    this.verifyResetCode,
    this.resetPassword,
  }) : screenSection = screenSection ?? EmailSendSection();

  ForgetPasswordState copyWith({
    ForgetPasswordScreenSection? screenSection,
    BaseState<UserEntity>? passwordResetEmail,
    BaseState<UserEntity>? verifyResetCode,
    BaseState<UserEntity>? resetPassword,
  }) {
    return ForgetPasswordState(
      screenSection: screenSection ?? this.screenSection,
      passwordResetEmail: passwordResetEmail ?? this.passwordResetEmail,
      verifyResetCode: verifyResetCode ?? this.verifyResetCode,
      resetPassword: resetPassword ?? this.resetPassword,
    );
  }
}

sealed class ForgetPasswordScreenSection {}

class EmailSendSection extends ForgetPasswordScreenSection {}

class VerificationCodeSection extends ForgetPasswordScreenSection {}

class PasswordResetSection extends ForgetPasswordScreenSection {}
