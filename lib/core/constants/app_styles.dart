import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';

abstract final class AppStyles {
  static const TextStyle screenTitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: AppColors.black,
  );

  static const TextStyle textFieldLabel = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.darkGrey,
    fontSize: 14,
  );

  static const TextStyle textFieldHint = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
    fontSize: 14,
  );

  static const TextStyle elevatedButton = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const TextStyle defaultText = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static const TextStyle linkStyledTextButton = TextStyle(
    color: AppColors.blue,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.blue,
  );

  static const TextStyle medium18Text = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w500,
    fontFamily: AppConstant.appFont,
    fontSize: 18,
  );

  static const TextStyle bold18Text = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontFamily: AppConstant.appFont,
    fontSize: 18,
  );
}
