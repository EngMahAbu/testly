import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/features/auth/presentation/signup/view/signup_view.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppStrings.dontHaveAccount, style: TextStyle(fontSize: 16)),

        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupView()));
          },
          child: Text(
            AppStrings.signupButton,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              decoration: TextDecoration.underline,
              color: AppColors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
