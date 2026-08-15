import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/features/exam/domain/entities/exam_result_entity.dart';

class ScoreDiagram extends StatelessWidget {
  const ScoreDiagram({super.key, required this.result});
  final ExamResultEntity result;
  @override
  Widget build(BuildContext context) {
    final progress = result.correctAnswers / result.totalQuestions;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 130,
              height: 130,
              child: CircularProgressIndicator(
                value: progress.clamp(0, 1),
                strokeWidth: 6,
                color: AppColors.blue,
                backgroundColor: AppColors.lightRed,
              ),
            ),
            Text(
              '${result.percentage.toStringAsFixed(0)}%',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        SizedBox(width: 23),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.correctText,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.blue,
                    ),
                  ),
                  SizedBox(height: 11),
                  Text(
                    AppStrings.inCorrectText,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.lightRed,
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blue, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        result.correctAnswers.toString(),
                        style: TextStyle(color: AppColors.blue),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: 30,
                    height: 30,

                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightRed, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        result.wrongAnswers.toString(),
                        style: TextStyle(color: AppColors.lightRed),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
