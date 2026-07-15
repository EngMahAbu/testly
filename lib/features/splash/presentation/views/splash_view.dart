import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/features/splash/presentation/view_models/splash_cubit.dart';
import 'package:testly/features/splash/presentation/views/wedgits/splash_viewbody.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SplashCubit>(
        create: (_) => getIt<SplashCubit>(),
        child: SplashViewBody(),
      ),
    );
  }
}
