import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/features/exam/domain/entities/question_entity.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.questions,
    required this.currentIndex,
  });
  final int currentIndex;
  final List<QuestionEntity> questions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "${AppStrings.questionText} ${currentIndex + 1}/${questions.length}",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          children: List.generate(questions.length, (index) {
            return Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  color: index <= currentIndex
                      ? AppColors.blue
                      : AppColors.grey,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
