import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/core/constants/app_styles.dart';
import 'package:testly/features/auth/presentation/forget_password/view/widgets/otp_view.dart';
import 'package:testly/features/auth/presentation/forget_password/view_model/cubit/forget_password_view_model.dart';

class VerificationSection extends StatefulWidget {
  final ForgetPasswordViewModel _forgetPasswordViewModel;

  const VerificationSection({
    super.key,
    required ForgetPasswordViewModel forgetPasswordViewModel,
  }) : _forgetPasswordViewModel = forgetPasswordViewModel;

  @override
  State<VerificationSection> createState() => _VerificationSectionState();
}

class _VerificationSectionState extends State<VerificationSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 16,
      ).copyWith(top: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              AppStrings.verificationSectionSubTitle,
              style: AppStyles.bold18Text,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const Text(
              AppStrings.verificationNote,
              style: AppStyles.textFieldLabel,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            OtpView(
              itemCount: 4,
              separator: () => SizedBox(width: 15),
              onSubmit: (value) {
                widget._forgetPasswordViewModel.verifyResetCode(value);
              },
              showError:
                  widget
                      ._forgetPasswordViewModel
                      .state
                      .verifyResetCode
                      ?.errorMessage
                      .isNotEmpty ??
                  false,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppStrings.didntReceiveCode, style: AppStyles.defaultText),
                TextButton(
                  onPressed: () {
                    // TODO: Implement this button later
                  },
                  child: Text(
                    AppStrings.resendButton,
                    style: AppStyles.linkStyledTextButton,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
