import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/features/auth/presentation/login/view_model/cubit/login_cubit.dart';
import 'package:testly/features/auth/presentation/login/view_model/cubit/login_state.dart';

class RememberMeAndForgetPassword extends StatefulWidget {
  const RememberMeAndForgetPassword({super.key});

  @override
  State<RememberMeAndForgetPassword> createState() =>
      _RememberMeAndForgetPasswordState();
}

bool value = false;

class _RememberMeAndForgetPasswordState
    extends State<RememberMeAndForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            BlocBuilder<LoginViewModel, LoginState>(
              builder: (context, state) {
                return Checkbox(
                  value: state.rememberMe,
                  onChanged: (value) {
                    context.read<LoginViewModel>().changeRememberMe(value!);
                  },
                );
              },
            ),

            Text("Remember me", style: TextStyle(fontSize: 13)),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Forget password?",
            style: TextStyle(color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
