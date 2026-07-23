import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_images.dart';
import 'package:testly/core/constants/app_strings.dart';

class ExamDetailsCard extends StatelessWidget {
  const ExamDetailsCard({
    super.key,
    required this.title,
    required this.numOfQuestion,
    required this.duration,
    required this.isActive,
  });
  final String title;
  final String numOfQuestion;
  final String duration;
  final bool isActive;
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 24),
          Row(
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
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "$numOfQuestion ${AppStrings.questionsText}",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  isActive
                      ? Text(
                          AppStrings.enableText,
                          style: TextStyle(
                            color: AppColors.lightGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          AppStrings.disableText,
                          style: TextStyle(
                            color: AppColors.lightRed,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ],
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              "$duration ${AppStrings.minutesText}",
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: 24),
        ],
      ),
    );
  }
}
