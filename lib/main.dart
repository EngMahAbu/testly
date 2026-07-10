import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/core/ui/theme/app_theme.dart';
import 'package:testly/features/auth/presentaion/login/view_model/cubit/login_cubit.dart';
import 'package:testly/features/splash/presentation/view_models/splash_cubit.dart';
import 'package:testly/features/splash/presentation/views/splash_view.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginViewModel>(create: (_) => getIt<LoginViewModel>()),
        BlocProvider<SplashCubit>(create: (_) => getIt<SplashCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: SplashView(),
      ),
    );
  }
}
