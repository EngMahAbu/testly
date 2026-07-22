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

class EmailSection extends StatefulWidget {
  final ForgetPasswordViewModel _forgetPasswordViewModel;

  const EmailSection({
    super.key,
    required ForgetPasswordViewModel forgetPasswordViewModel,
  }) : _forgetPasswordViewModel = forgetPasswordViewModel;

  @override
  State<EmailSection> createState() => _EmailSectionState();
}

class _EmailSectionState extends State<EmailSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

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
                AppStrings.emailSectionSubTitle,
                style: AppStyles.bold18Text,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const Text(
                AppStrings.emailSectionNote,
                style: AppStyles.textFieldLabel,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              MainTextField(
                label: AppStrings.emailTextFieldLabel,
                hint: AppStrings.emailTextFieldHint,
                controller: emailController,
                validationPattern: FormValidator.emailPattern,
                validationErrorMessage: AppStrings.emailValidationError,
                onChange: (_) {
                  if (!widget
                          ._forgetPasswordViewModel
                          .state
                          .isMainButtonEnabled &&
                      formKey.currentState!.validate()) {
                    widget._forgetPasswordViewModel.doEvent(
                      ToggleMainButton(true),
                    );
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      !widget._forgetPasswordViewModel.state.isMainButtonEnabled
                      ? null
                      : () async {
                          if (formKey.currentState!.validate()) {
                            widget._forgetPasswordViewModel.doEvent(
                              SendResetCodeEmail(emailController.text),
                            );
                          } else {
                            widget._forgetPasswordViewModel.doEvent(
                              ToggleMainButton(false),
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
                            if (state.passwordResetEmail!.isLoading) {
                              return const CircularProgressIndicator(
                                color: AppColors.white,
                              );
                            } else {
                              return const Text(
                                AppStrings.signupButton,
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
    emailController.dispose();
  }
}
