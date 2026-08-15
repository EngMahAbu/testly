import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_cubit.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_events.dart';
import 'package:testly/features/exam/presentation/widgets/exams_of_subject_list_view.dart';

class ExamDetailsView extends StatelessWidget {
  const ExamDetailsView({super.key, required this.id, required this.title});
  final String id;
  final String title;
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
          title,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: BlocProvider<ExamCubit>(
        create: (context) =>
            getIt.get<ExamCubit>()..doEvent(GetExams(subjectId: id)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Exams of $title",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24),
                ExamsOfSubjectListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
