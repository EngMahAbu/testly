import 'package:flutter/material.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/config/dio/token_service.dart';
import 'package:testly/features/auth/presentation/login/view/login_view.dart';
import 'package:testly/features/profile/presentation/view/profile_view.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: 
          Text("data"),),
            TextButton(
            onPressed: () async {
              final tokenService = getIt<TokenService>();
              await tokenService.clear();
         

              if (!context.mounted) return;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              );
            },
            child: Text("Log Out"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileView()),
              );
            },
            child: Text("Profile"),
          ),
     
        ],
      ),
    );
  }
}