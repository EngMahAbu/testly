import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/core/constants/app_styles.dart';
import 'package:testly/core/ui/widgets/main_text_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsetsDirectional.only(start: 16.0),
          child: Icon(Icons.arrow_back_ios, color: AppColors.black),
        ),
        title: Text(AppStrings.signupScreenTitle),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 16,
        ).copyWith(top: 24),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                MainTextField(
                  label: AppStrings.usernameTextFieldLabel,
                  hint: AppStrings.usernameTextFieldHint,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: MainTextField(
                        label: AppStrings.firstNameTextFieldLabel,
                        hint: AppStrings.firstNameTextFieldHint,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: MainTextField(
                        label: AppStrings.lastNameTextFieldLabel,
                        hint: AppStrings.lastNameTextFieldHint,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                MainTextField(
                  label: AppStrings.emailTextFieldLabel,
                  hint: AppStrings.emailTextFieldHint,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: MainTextField(
                        label: AppStrings.passwordTextFieldLabel,
                        hint: AppStrings.passwordTextFieldHint,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: MainTextField(
                        label: AppStrings.confirmPasswordTextFieldLabel,
                        hint: AppStrings.confirmPasswordTextFieldHint,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                MainTextField(
                  label: AppStrings.phoneNumberTextFieldLabel,
                  hint: AppStrings.phoneNumberTextFieldHint,
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        AppStrings.signupButton,
                        style: AppStyles.elevatedButton,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.alreadyHaveAccount,
                      style: AppStyles.defaultText,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.loginButton,
                        style: AppStyles.linkStyledTextButton,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
