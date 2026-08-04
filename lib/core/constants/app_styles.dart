import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_constants.dart';

abstract final class AppStyles {
  static const TextStyle screenTitle = TextStyle(
    fontFamily: AppConstant.appFont,
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: AppColors.blackShade,
  );

  static const TextStyle textFieldLabel = TextStyle(
    fontFamily: AppConstant.appFont,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGrey,
    fontSize: 14,
  );

  static const TextStyle textFieldHint = TextStyle(
    fontFamily: AppConstant.appFont,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
    fontSize: 14,
  );

  static const TextStyle elevatedButton = TextStyle(
    fontFamily: AppConstant.appFont,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const TextStyle defaultText = TextStyle(
    fontFamily: AppConstant.appFont,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static const TextStyle linkStyledTextButton = TextStyle(
    fontFamily: AppConstant.appFont,
    color: AppColors.blue,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.blue,
  );
}
