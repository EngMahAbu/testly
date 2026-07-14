import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/features/exam/presentation/view/exam_details.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_cubit.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_state.dart';
import 'package:testly/features/exam/presentation/widgets/subject_card.dart';

class SubjectsListview extends StatelessWidget {
  const SubjectsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamCubit, ExamState>(
      builder: (context, state) {
        final subjectStates = state.subjects;
        if (subjectStates?.isLoading == true) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: const Center(child: CircularProgressIndicator()),
          );
        } else if (subjectStates!.errorMessage.isNotEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text(subjectStates.errorMessage)),
          );
        }

        final subjects = subjectStates.data ?? [];
        if (subjects.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text(AppStrings.notFoundSubjects)),
          );
        }
         
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 24),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExamDetails(
                          id: subjects[index].id.toString(),
                          title: subjects[index].name.toString(),
                        ),
                      ),
                    );
                  },
                  child: SubjectCard(
                    subject: subjects[index].name.toString(),
                    subjectImg: subjects[index].icon.toString(),
                  ),
                ),
              );
            }, childCount: subjects.length),
          ),
        );
      },
    );
  }
}
