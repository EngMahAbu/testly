import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_strings.dart';

Future<bool?> showFinishDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 28),
            SizedBox(width: 10),
            Text(AppStrings.finishExamText),
          ],
        ),
        content: Text(
          AppStrings.warningMessageOfFinishExamText,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
        actionsPadding: const EdgeInsets.only(left: 49, right: 49, bottom: 20),

        actions: [
          Column(
            children: [
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context, false),

                  child: Text(AppStrings.cancelButton),
                ),
              ),
              SizedBox(
                width: 250,
                child: TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.lightRed,
                  ),
                  child: Text(
                    AppStrings.submitButton,
                    style: TextStyle(
                      color: AppColors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
