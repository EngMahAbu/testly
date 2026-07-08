import 'package:flutter/material.dart';
import 'package:testly/features/auth/presentation/signup/view/signup_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupView()),
    );
    return Scaffold();
  }
}
