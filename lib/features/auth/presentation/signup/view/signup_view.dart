import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/config/form_validator/form_validator.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/core/constants/app_styles.dart';
import 'package:testly/core/ui/widgets/main_text_field.dart';
import 'package:testly/features/auth/data/models/signup_request.dart';
import 'package:testly/features/auth/presentation/signup/view_model/cubit/signup_state.dart';
import 'package:testly/features/auth/presentation/signup/view_model/cubit/signup_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final SignupViewModel _signupViewModel = getIt.get<SignupViewModel>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupViewModel>(
      create: (context) => _signupViewModel,
      child: BlocListener<SignupViewModel, SignupState>(
        listener: (context, state) {
          if (state.signup!.data != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.signup!.data!.firstName} Signed Up'),
                backgroundColor: AppColors.blue,
              ),
            );
          } else if (state.signup!.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: ${state.signup!.errorMessage}'),
                backgroundColor: AppColors.lightRed,
              ),
            );
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MainTextField(
                      label: AppStrings.usernameTextFieldLabel,
                      hint: AppStrings.usernameTextFieldHint,
                      controller: usernameController,
                      validationPattern: FormValidator.usernamePattern,
                      validationErrorMessage:
                          AppStrings.usernameValidationError,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: MainTextField(
                            label: AppStrings.firstNameTextFieldLabel,
                            hint: AppStrings.firstNameTextFieldHint,
                            controller: firstNameController,
                            validationPattern: FormValidator.namePattern,
                            validationErrorMessage:
                                AppStrings.nameValidationError,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: MainTextField(
                            label: AppStrings.lastNameTextFieldLabel,
                            hint: AppStrings.lastNameTextFieldHint,
                            controller: lastNameController,
                            validationPattern: FormValidator.namePattern,
                            validationErrorMessage:
                                AppStrings.nameValidationError,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    MainTextField(
                      label: AppStrings.emailTextFieldLabel,
                      hint: AppStrings.emailTextFieldHint,
                      controller: emailController,
                      validationPattern: FormValidator.emailPattern,
                      validationErrorMessage: AppStrings.emailValidationError,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: MainTextField(
                            label: AppStrings.passwordTextFieldLabel,
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
                                  return AppStrings
                                      .passwordLengthValidationError;
                                case UppercaseError():
                                  return AppStrings
                                      .passwordUppercaseValidationError;
                                case LowercaseError():
                                  return AppStrings
                                      .passwordLowercaseValidationError;
                                case NumberError():
                                  return AppStrings
                                      .passwordNumberValidationError;
                                case SpecialCharError():
                                  return AppStrings
                                      .passwordSpecialCharValidationError;
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: MainTextField(
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
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    MainTextField(
                      label: AppStrings.phoneNumberTextFieldLabel,
                      hint: AppStrings.phoneNumberTextFieldHint,
                      controller: phoneController,
                      validationPattern: FormValidator.phonePattern,
                      validationErrorMessage: AppStrings.phoneValidationError,
                    ),
                    const SizedBox(height: 48),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            _signupViewModel.signup(prepareSignupRequest());
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blue,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: BlocBuilder<SignupViewModel, SignupState>(
                            builder: (context, state) {
                              if (state.signup!.isLoading) {
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
        ),
      ),
    );
  }

  SignupRequest prepareSignupRequest() => SignupRequest(
    username: usernameController.text,
    firstName: firstNameController.text,
    lastName: lastNameController.text,
    email: emailController.text,
    password: passwordController.text,
    rePassword: confirmPasswordController.text,
    phone: phoneController.text,
  );

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
  }
}
