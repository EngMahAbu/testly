import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/core/constants/app_constants.dart';
import 'package:testly/features/auth/presentation/login/view/login_view.dart';
import 'package:testly/features/exam/presentation/view/subjects_view.dart';
import 'package:testly/features/splash/presentation/view_models/splash_cubit.dart';
import 'package:testly/features/splash/presentation/view_models/splash_state.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<Offset> slidelogo;
  @override
  void initState() {
    super.initState();
    initslideAnimation();
    navigatebetweenpages();
    context.read<SplashCubit>().checkLogin();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        
        if (state is SplashAuthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SubjectsView()),
          );
        }

        if (state is SplashUnauthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginView()),
          );
        }
      },

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedBuilder(
            animation: slidelogo,
            builder: (context, _) {
              return SlideTransition(
                position: slidelogo,
                child: Image.asset(AppConstant.testlyImage, width: 130),
              );
            },
          ),
        ],
      ),
    );
  }

  void initslideAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(animationController);
    slidelogo = Tween(
      begin: const Offset(5, 0),
      end: Offset.zero,
    ).animate(animationController);
    // Start the animation
    animationController.forward();
  }

  void navigatebetweenpages() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => LoginView()),
      );
    });
  }
}
