import 'package:flutter/material.dart';
 
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_images.dart';
import 'package:testly/core/constants/app_strings.dart';

class ResultHistoryCard extends StatelessWidget {
  final String examTitle;
  final DateTime  duration;
  final double score;
  final int correctAnswers;
  final int totalQuestions;
  final VoidCallback onTap;

  const ResultHistoryCard({super.key, 
    required this.examTitle,
    required this.score,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.onTap,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      decoration: BoxDecoration(
        color: const Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0x402A2929),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 12),
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 70,
                    child: Image.asset(
                      AppImages.profitImage,
                      fit: BoxFit.contain,
                      errorBuilder: (_, _, _) => const Icon(Icons.broken_image),
                    ),
                  ),
                  // const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
              
                    children: [
                      SizedBox(height: 16),
              
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            examTitle,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "$totalQuestions ${AppStrings.questionsText}",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "$correctAnswers corrected , ",
                              style: TextStyle(
                                color: AppColors.lightGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${totalQuestions - correctAnswers} incorrect",
                              style: TextStyle(
                                color: AppColors.lightRed,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            FittedBox(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16,right: 8),
                    child: Text( 
                      "Ended: ${duration.year}/${duration.month}/${duration.day}",
                      style: TextStyle(
                        color: AppColors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text("Time: ${duration.hour}:${duration.minute}")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}