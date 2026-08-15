import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_constants.dart';

abstract final class AppStyles {
  static const TextStyle screenTitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    fontFamily: AppConstants.appFont,
    color: AppColors.black,
  );

  static const TextStyle textFieldLabel = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.darkGrey,
    fontFamily: AppConstants.appFont,
    fontSize: 14,
  );

  static const TextStyle textFieldHint = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
    fontFamily: AppConstants.appFont,
    fontSize: 14,
  );

  static const TextStyle elevatedButton = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w500,
    fontFamily: AppConstants.appFont,
    fontSize: 16,
  );

  static const TextStyle defaultText = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: AppConstants.appFont,
    fontSize: 16,
  );

  static const TextStyle linkStyledTextButton = TextStyle(
    color: AppColors.blue,
    fontWeight: FontWeight.w500,
    fontFamily: AppConstants.appFont,
    fontSize: 16,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.blue,
  );

  static const TextStyle defaultTextButton = TextStyle(
    color: AppColors.blue,
    fontWeight: FontWeight.w500,
    fontFamily: AppConstants.appFont,
    decoration: TextDecoration.none,
    fontSize: 14,
    decorationColor: AppColors.blue,
  );

  static const TextStyle bold18Text = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontFamily: AppConstants.appFont,
    fontSize: 18,
  );
}
