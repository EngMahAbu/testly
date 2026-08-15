import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_images.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/features/exam/presentation/view/exam_score_view.dart';
import 'package:testly/features/exam/presentation/view_model/exam_feat_cubit/exam_state.dart';

Future<dynamic> showTimeoutDialog(BuildContext context, ExamState state) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          titlePadding: EdgeInsets.only(bottom: 24, top: 40),
          contentPadding: EdgeInsets.only(bottom: 40, left: 40, right: 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
          backgroundColor: AppColors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.sandClockImage),
              Text(
                AppStrings.timeOutText,
                style: TextStyle(color: AppColors.lightRed),
              ),
            ],
          ),

          content: ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => ExamScoreView(result: state.submitExam.data!),
                ),
              );
            },
            child: Text(AppStrings.viewScoreButton),
          ),
        ),
      );
    },
  );
}
