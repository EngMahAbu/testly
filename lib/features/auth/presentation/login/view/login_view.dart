import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/config/form_validator/form_validator.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/features/auth/data/models/login_request.dart';
import 'package:testly/features/auth/presentation/login/view_model/cubit/login_cubit.dart';
import 'package:testly/features/auth/presentation/login/view_model/cubit/login_state.dart';
import 'package:testly/features/auth/presentation/login/widgets/dont_have_account.dart';
import 'package:testly/features/auth/presentation/login/widgets/remember_me_and_forget_password.dart';
import 'package:testly/features/exam/presentation/view/exam_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? errorMessage;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginViewModel>(
      create: (_) => getIt<LoginViewModel>(),

      child: BlocConsumer<LoginViewModel, LoginState>(
        listener: (context, state) {
          if (state.login!.data != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.login!.data!.firstName} Success Login'),
                backgroundColor: AppColors.blue,
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ExamView()),
            );
          } else if (state.login!.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: ${state.login!.errorMessage}'),
                backgroundColor: AppColors.lightRed,
              ),
            );
          }
        },

        builder: (context, state) {
          bool isLoading = state.login!.isLoading;
          return Scaffold(
            appBar: AppBar(
              leading: const Padding(
                padding: EdgeInsetsDirectional.only(start: 16.0),
                child: Icon(Icons.arrow_back_ios, color: AppColors.black),
              ),
              title: Text(AppStrings.loginScreenTitle),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: AppStrings.emailTextFieldHint,
                          labelText: AppStrings.emailTextFieldLabel,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
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
                              return AppStrings
                                  .passwordUppercaseValidationError;
                            case LowercaseError():
                              return AppStrings
                                  .passwordLowercaseValidationError;
                            case NumberError():
                              return AppStrings.passwordNumberValidationError;
                            case SpecialCharError():
                              return AppStrings
                                  .passwordSpecialCharValidationError;
                          }
                        },

                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: AppStrings.passwordTextFieldHint,
                          labelText: AppStrings.passwordTextFieldLabel,
                        ),
                      ),
                      const RememberMeAndForgetPassword(),
                      if (errorMessage != null) ...[
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            errorMessage!,
                            style: TextStyle(color: Colors.red.shade700),
                          ),
                        ),
                      ],
                      const SizedBox(height: 48),
                      SizedBox(
                        width: 343,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                errorMessage = null;
                              });
                              context.read<LoginViewModel>().login(
                                LoginRequest(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          },
                          child: isLoading
                              ? CircularProgressIndicator(
                                  backgroundColor: AppColors.white,
                                )
                              : const Text(
                                  AppStrings.loginButton,
                                  style: TextStyle(fontSize: 16),
                                ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const DontHaveAccount(),

                      SizedBox(height: 33),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
