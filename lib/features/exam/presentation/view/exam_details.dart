import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_cubit.dart';

class ExamDetails extends StatelessWidget {
  const ExamDetails({super.key, required this.id, required this.title});
  final String id;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 15,
        title: Text(
          AppStrings.examScreenTitle,
          style: TextStyle(
            color: AppColors.blue,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: BlocProvider<ExamCubit>(
        create: (context) => getIt.get<ExamCubit>()..getExams(id),
        child: SafeArea(
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(id),
            ],
          ),
        ),
      ),
    );
  }
}
