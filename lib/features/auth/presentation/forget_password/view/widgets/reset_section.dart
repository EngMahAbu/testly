import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/config/form_validator/form_validator.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/core/constants/app_styles.dart';
import 'package:testly/core/ui/widgets/main_text_field.dart';
import 'package:testly/features/auth/presentation/forget_password/view_model/forget_password_event.dart';
import 'package:testly/features/auth/presentation/forget_password/view_model/forget_password_state.dart';
import 'package:testly/features/auth/presentation/forget_password/view_model/forget_password_view_model.dart';

class ResetSection extends StatefulWidget {
  final ForgetPasswordViewModel _forgetPasswordViewModel;

  const ResetSection({
    super.key,
    required ForgetPasswordViewModel forgetPasswordViewModel,
  }) : _forgetPasswordViewModel = forgetPasswordViewModel;

  @override
  State<ResetSection> createState() => _ResetSectionState();
}

class _ResetSectionState extends State<ResetSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 16,
      ).copyWith(top: 24),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                AppStrings.resetSectionSubTitle,
                style: AppStyles.bold18Text,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const Text(
                AppStrings.resetSectionNote,
                style: AppStyles.textFieldLabel,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              MainTextField(
                label: AppStrings.newPassword,
                hint: AppStrings.passwordTextFieldHint,
                controller: passwordController,
                validator: (input) {
                  if (input == null) {
                    return AppStrings.generalValidationError;
                  }

                  if (input.isEmpty) {
                    return AppStrings.emptyValidationError;
                  }

                  switch (FormValidator.validatePassword(input)) {
                    case Valid():
                      return null;
                    case LengthError():
                      return AppStrings.passwordLengthValidationError;
                    case UppercaseError():
                      return AppStrings.passwordUppercaseValidationError;
                    case LowercaseError():
                      return AppStrings.passwordLowercaseValidationError;
                    case NumberError():
                      return AppStrings.passwordNumberValidationError;
                    case SpecialCharError():
                      return AppStrings.passwordSpecialCharValidationError;
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              MainTextField(
                label: AppStrings.confirmPasswordTextFieldLabel,
                hint: AppStrings.confirmPasswordTextFieldHint,
                controller: confirmPasswordController,
                validator: (input) {
                  if (input == null) {
                    return AppStrings.generalValidationError;
                  }

                  if (input.isEmpty) {
                    return AppStrings.emptyValidationError;
                  }

                  if (passwordController.text !=
                      confirmPasswordController.text) {
                    return AppStrings.confirmPasswordError;
                  }

                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              SizedBox(
                width: double.infinity,
                // TODO: make this button be disabled while validation in UI optimization
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      widget._forgetPasswordViewModel.doEvent(
                        ResetPassword(passwordController.text),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child:
                        BlocBuilder<
                          ForgetPasswordViewModel,
                          ForgetPasswordState
                        >(
                          builder: (context, state) {
                            if (state.resetPassword!.isLoading) {
                              return const CircularProgressIndicator(
                                color: AppColors.white,
                              );
                            } else {
                              return const Text(
                                AppStrings.continueButton,
                                style: AppStyles.elevatedButton,
                              );
                            }
                          },
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }
}
