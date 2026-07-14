import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_cubit.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_state.dart';
import 'package:testly/features/exam/presentation/widgets/exam_details_card.dart';

class ExamsOfExamListView extends StatelessWidget {
  const ExamsOfExamListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamCubit, ExamState>(
      builder: (context, state) {
        final examsState = state.exams;

        if (examsState == null || examsState.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (examsState.errorMessage.isNotEmpty) {
          return Expanded(child: Center(child: Text(examsState.errorMessage)));
        }

        final exams = examsState.data ?? [];

        if (exams.isEmpty) {
          return Expanded(
            child: const Center(
              child: Text(
                AppStrings.notFoundExams,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }

        return Expanded(
          child: ListView.builder(
            itemCount: exams.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: () async {
                    // await Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ExamDetails(
                    //       id: subjects[index].id.toString(),
                    //       title: subjects[index].name.toString(),
                    //     ),
                    //   ),
                    // );
                  },
                  child: ExamDetailsCard(
                    title: exams[index].title.toString(),
                    numOfQuestion: exams[index].numberOfQuestions.toString(),
                    duration: exams[index].duration.toString(),
                    isActive: exams[index].active,
                  ),
                ),
              );
            },
          ),
        );

        // return SliverPadding(
        //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 24),
        //   sliver: SliverList(
        //     delegate: SliverChildBuilderDelegate((
        //       BuildContext context,
        //       int index,
        //     ) {
        //       return Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 8),
        //         child: GestureDetector(
        //           onTap: () async {
        //             // await Navigator.push(
        //             //   context,
        //             //   MaterialPageRoute(
        //             //     builder: (context) => ExamDetails(
        //             //       id: subjects[index].id.toString(),
        //             //       title: subjects[index].name.toString(),
        //             //     ),
        //             //   ),
        //             // );
        //           },
        //           child: ExamDetailsCard(
        //             title: exams[index].title.toString(),
        //             numOfQuestion: exams[index].numberOfQuestions.toString(),
        //             duration: exams[index].duration.toString(),
        //             isActive: exams[index].active,
        //           ),
        //         ),
        //       );
        //     }, childCount: exams.length),
        //   ),
        // );
      },
    );
  }
}
