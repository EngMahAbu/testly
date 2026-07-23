import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/features/exam/domain/entities/question_entity.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_events.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_state.dart';
import 'package:testly/features/exam/presentation/widgets/show_finish_dialog.dart';

class NextAndBackButton extends StatelessWidget {
  const NextAndBackButton({super.key, required this.questions, required this.state, }) ;
  final ExamState state;
  final List<QuestionEntity> questions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              side: BorderSide(color: AppColors.blue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10),
              ),
              textStyle: TextStyle(decoration: TextDecoration.none),
            ),
            onPressed: () {
              context.read<ExamCubit>().doEvent(PreviousQuestion());
            },
            child: Text(
              AppStrings.backButton,
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: BorderSide(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10),
              ),
            ),
            onPressed: () async {
              if (state.currentQuestionIndex == questions.length - 1) {
                final confirm = await showFinishDialog(context);

                if (confirm == true) {
                  context.read<ExamCubit>().doEvent(SubmitExam());
                }
              } else {
                context.read<ExamCubit>().doEvent(NextQuestion());
              }
            },
            child: Text(
              state.currentQuestionIndex == questions.length - 1
                  ? AppStrings.finishButton
                  : AppStrings.nextButton,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}