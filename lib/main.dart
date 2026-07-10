import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/core/ui/theme/app_theme.dart';
import 'package:testly/features/auth/presentaion/login/view/login_view.dart';
import 'package:testly/features/auth/presentaion/login/view_model/cubit/login_cubit.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<loginViewModel>(
      create: (_) => getIt<loginViewModel>(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: LoginView(),
      ),
    );
  }
}
