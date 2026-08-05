import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/core/ui/widgets/main_app_bar.dart';
import 'package:testly/features/auth/presentation/forget_password/view/widgets/email_section.dart';
import 'package:testly/features/auth/presentation/forget_password/view/widgets/reset_section.dart';
import 'package:testly/features/auth/presentation/forget_password/view/widgets/verification_section.dart';
import 'package:testly/features/auth/presentation/forget_password/view_model/cubit/forget_password_state.dart';
import 'package:testly/features/auth/presentation/forget_password/view_model/cubit/forget_password_view_model.dart';

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
      child: BlocListener<ForgetPasswordViewModel, ForgetPasswordState>(
        listener: (context, state) {
          // TODO: This could be improved, search for a design pattern or a simpler approach
          switch (state.screenSection) {
            case EmailSendSection():
              if (state.passwordResetEmail!.data != null) {
                // TODO: Modify this when endpoint is fixed
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${state.passwordResetEmail!.data!.firstName} Signed Up',
                    ),
                    backgroundColor: AppColors.blue,
                  ),
                );
              } else if (state.passwordResetEmail!.errorMessage.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.passwordResetEmail!.errorMessage),
                    backgroundColor: AppColors.lightRed,
                  ),
                );
              }
            case VerificationCodeSection():
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
                _forgetPasswordViewModel.toggleVerificationCodeDialog(true);
              } else if (state.verifyResetCode!.data != null) {
                // TODO: Modify this when endpoint is fixed
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${state.verifyResetCode!.data!.firstName} Code Verified',
                    ),
                    backgroundColor: AppColors.blue,
                  ),
                );
              } else if (state.verifyResetCode!.errorMessage.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.verifyResetCode!.errorMessage),
                    backgroundColor: AppColors.lightRed,
                  ),
                );
              }
            case PasswordResetSection():
              // TODO: Modify this when endpoint is fixed
              if (state.resetPassword!.data != null &&
                  !state.resetPassword!.isLoading) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${state.resetPassword!.data?.firstName} Successful',
                    ),
                    backgroundColor: AppColors.blue,
                  ),
                );
              } else if (state.resetPassword!.errorMessage.isNotEmpty &&
                  !state.resetPassword!.isLoading) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.resetPassword!.errorMessage),
                    backgroundColor: AppColors.lightRed,
                  ),
                );
              }
          }
        },
        child: Scaffold(
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
                  if (_forgetPasswordViewModel.isVerificationCodeDialogShown) {
                    Navigator.pop(context);
                    _forgetPasswordViewModel.toggleVerificationCodeDialog(
                      false,
                    );
                  }
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
}
