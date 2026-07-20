sealed class ForgetPasswordEvent {}

class SendResetCodeEmail extends ForgetPasswordEvent {
  final String email;

  SendResetCodeEmail(this.email);
}

class VerifyResetCode extends ForgetPasswordEvent {
  final String resetCode;

  VerifyResetCode(this.resetCode);
}

class ResetPassword extends ForgetPasswordEvent {
  final String newPassword;

  ResetPassword(this.newPassword);
}

class ToggleVerificationCodeLoadingDialog extends ForgetPasswordEvent {
  final bool isShown;

  ToggleVerificationCodeLoadingDialog(this.isShown);
}
