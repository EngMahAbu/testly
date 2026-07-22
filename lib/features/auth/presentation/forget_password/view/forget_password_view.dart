import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/core/ui/widgets/main_app_bar.dart';
import 'package:testly/features/auth/presentation/forget_password/view/widgets/email_section.dart';
import 'package:testly/features/auth/presentation/forget_password/view/widgets/reset_section.dart';
import 'package:testly/features/auth/presentation/forget_password/view/widgets/verification_section.dart';
import 'package:testly/features/auth/presentation/forget_password/view_model/forget_password_event.dart';
import 'package:testly/features/auth/presentation/forget_password/view_model/forget_password_state.dart';
import 'package:testly/features/auth/presentation/forget_password/view_model/forget_password_view_model.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final ForgetPasswordViewModel _forgetPasswordViewModel = getIt
      .get<ForgetPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordViewModel>(
      create: (context) => _forgetPasswordViewModel,
      child: MultiBlocListener(
        listeners: [
          BlocListener<ForgetPasswordViewModel, ForgetPasswordState>(
            listenWhen: (previous, current) =>
                previous.passwordResetEmail != current.passwordResetEmail,
            listener: (context, state) {
              final emailResult = state.passwordResetEmail!;
              if (!emailResult.isLoading) {
                // TODO: Modify this when endpoint is fixed
                if (emailResult.data != null) {
                  _showSnackBar('Email sent to ${emailResult.data!.firstName}');
                }
                if (emailResult.errorMessage.isNotEmpty) {
                  _showSnackBar(emailResult.errorMessage, isError: true);
                }
              }
            },
          ),
          BlocListener<ForgetPasswordViewModel, ForgetPasswordState>(
            listenWhen: (previous, current) =>
                previous.verifyResetCode != current.verifyResetCode,
            listener: (context, state) {
              if (state.verifyResetCode!.isLoading) {
                // TODO: Modify this when endpoint is fixed
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: Colors.black.withAlpha(100),
                  builder: (BuildContext context) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  },
                );
                _forgetPasswordViewModel.doEvent(
                  ToggleVerificationCodeLoadingDialog(true),
                );
              } else if (_forgetPasswordViewModel
                  .isVerificationCodeDialogShown) {
                Navigator.pop(context);
                _forgetPasswordViewModel.doEvent(
                  ToggleVerificationCodeLoadingDialog(false),
                );

                final verifyResult = state.verifyResetCode!;
                if (!verifyResult.isLoading) {
                  // TODO: Modify this when endpoint is fixed
                  if (verifyResult.data != null) {
                    _showSnackBar('Code Verified Successfully');
                  }
                  if (verifyResult.errorMessage.isNotEmpty) {
                    _showSnackBar(verifyResult.errorMessage, isError: true);
                  }
                }
              }
            },
          ),
          BlocListener<ForgetPasswordViewModel, ForgetPasswordState>(
            listenWhen: (previous, current) =>
                previous.resetPassword != current.resetPassword,
            listener: (context, state) {
              final resetResult = state.resetPassword!;
              if (!resetResult.isLoading) {
                // TODO: Modify this when endpoint is fixed
                if (resetResult.data != null) {
                  _showSnackBar('Password Reset Successfully');
                }
                if (resetResult.errorMessage.isNotEmpty) {
                  _showSnackBar(resetResult.errorMessage, isError: true);
                }
              }
            },
          ),
        ],
        child: Scaffold(
          // TODO: Fix the back button behaviour
          appBar: MainAppBar(title: AppStrings.forgetPasswordScreenTitle),
          body: BlocBuilder<ForgetPasswordViewModel, ForgetPasswordState>(
            builder: (context, state) {
              switch (state.screenSection) {
                case EmailSendSection():
                  return EmailSection(
                    forgetPasswordViewModel: _forgetPasswordViewModel,
                  );
                case VerificationCodeSection():
                  return VerificationSection(
                    forgetPasswordViewModel: _forgetPasswordViewModel,
                  );
                case PasswordResetSection():
                  return ResetSection(
                    forgetPasswordViewModel: _forgetPasswordViewModel,
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? AppColors.lightRed : AppColors.blue,
      ),
    );
  }
}
