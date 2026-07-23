import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/features/exam/domain/entities/question_entity.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_cubit.dart';

class ChoiceListView extends StatelessWidget {
  const ChoiceListView({
    super.key,
    required this.questions,
    required this.selectedAnswer,
  });
  final String selectedAnswer;
  final QuestionEntity questions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(questions.answers.length, (index) {
        final answer = questions.answers[index];

        return GestureDetector(
          onTap: () {
            context.read<ExamCubit>().selectAnswer(
              answerKey: answer.key,
              questionId: questions.id,
            );
          },
          child: Container(
            height: 52,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: answer.key == selectedAnswer
                  ? Color(0xffCCD7EB)
                  : const Color(0xffEDEFF3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: RadioGroup(
              groupValue: selectedAnswer,
              onChanged: (value) {
                context.read<ExamCubit>().selectAnswer(
                  answerKey: value!,
                  questionId: questions.id,
                );
              },
              child: Row(
                children: [
                  Radio<String>(value: answer.key, activeColor: AppColors.blue),
                  Expanded(
                    child: Text(
                      answer.answer,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
