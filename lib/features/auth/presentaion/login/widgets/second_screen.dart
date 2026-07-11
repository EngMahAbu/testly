import 'package:flutter/material.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/features/auth/domain/use_cases/token_usecases/token_usecases.dart';
import 'package:testly/features/auth/presentation/login/view/login_view.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("email")),

          ElevatedButton(
            onPressed: () async{
               await getIt<DeleteTokenUseCase>()();

    if (!context.mounted) return;

    Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginView()));
            },
            child: Text("data"),
          ),
        ],
      ),
    );
  }
}
