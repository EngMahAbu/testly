import 'package:flutter/material.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/core/ui/theme/app_theme.dart';
import 'package:testly/features/splash/presentation/views/splash_view.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SplashView(),
    );
  }
}
