import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_constants.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/features/exam/domain/entities/exam_entity.dart';

class ExamDescription extends StatelessWidget {
  const ExamDescription({super.key, required this.exams});
  final ExamEntity exams;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 70,
                    child: Image.asset(
                      AppConstant.profitImage,
                      fit: BoxFit.contain,
                      errorBuilder: (_, _, _) => const Icon(Icons.broken_image),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    exams.title,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                "${exams.duration} ${AppStrings.minutesText}",
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          SizedBox(height: 8),
          Row(
            children: [
              exams.active
                  ? Text(
                      AppStrings.enableText,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.lightGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      AppStrings.disableText,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.lightRed,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              SizedBox(width: 8),

              SizedBox(
                width: 4,
                height: 21,
                child: VerticalDivider(color: Colors.black, thickness: 1),
              ),
              SizedBox(width: 8),
              Text(
                "${exams.numberOfQuestions} ${AppStrings.questionsText}",
                style: TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
