import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/config/form_validator/form_validator.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/core/constants/app_styles.dart';
import 'package:testly/core/ui/widgets/main_app_bar.dart';
import 'package:testly/core/ui/widgets/main_text_field.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordViewModel>(
      create: (context) => _forgetPasswordViewModel,
      child: BlocListener<ForgetPasswordViewModel, ForgetPasswordState>(
        listener: (context, state) {
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
        },
        child: Scaffold(
          appBar: MainAppBar(title: AppStrings.forgetPasswordScreenTitle),
          body: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 16,
            ).copyWith(top: 24),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      AppStrings.forgetPasswordScreenSubTitle,
                      style: AppStyles.medium18Text,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      AppStrings.forgetPasswordScreenNote,
                      style: AppStyles.textFieldLabel,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    MainTextField(
                      label: AppStrings.emailTextFieldLabel,
                      hint: AppStrings.emailTextFieldHint,
                      controller: emailController,
                      validationPattern: FormValidator.emailPattern,
                      validationErrorMessage: AppStrings.emailValidationError,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    SizedBox(
                      width: double.infinity,
                      // TODO: make this button be disabled while validation in UI optimization
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            _forgetPasswordViewModel.sendResetCodeEmail(
                              emailController.text,
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
                                    return CircularProgressIndicator(
                                      color: AppColors.white,
                                    );
                                  } else {
                                    return Text(
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
