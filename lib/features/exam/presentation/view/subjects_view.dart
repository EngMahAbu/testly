import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/config/dio/token_service.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/features/auth/presentation/login/view/login_view.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_cubit.dart';
import 'package:testly/features/exam/presentation/widgets/exam_text_field.dart';
import 'package:testly/features/exam/presentation/widgets/subjects_listview.dart';

class SubjectsView extends StatelessWidget {
  const SubjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        titleSpacing: 15,
        title: Text(
          AppStrings.examScreenTitle,
          style: TextStyle(
            color: AppColors.blue,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
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
        ],
      ),
      body: BlocProvider<ExamCubit>(
        create: (context) => getIt.get<ExamCubit>()..getSubjects(),
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExamTextField(),
                      SizedBox(height: 40),
                      Text(
                        AppStrings.browseBySubject,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SubjectsListview(),
            ],
          ),
        ),
      ),
    );
  }
}
