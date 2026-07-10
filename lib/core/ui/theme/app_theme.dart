import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_styles.dart';
 
import 'package:testly/core/constants/constant.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: AppConstant.appFont,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      titleSpacing: 0,
      elevation: 0,
      titleTextStyle: AppStyles.screenTitle,
      iconTheme: IconThemeData(color: AppColors.black, size: 24),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(decoration: TextDecoration.underline),
        foregroundColor: AppColors.blue,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
        elevation: 0,
        disabledBackgroundColor: AppColors.greyShade,
        foregroundColor: AppColors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // error label style
      floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return const TextStyle(color: AppColors.lightRed);
        }
        return const TextStyle(color: AppColors.darkGrey);
      }),
      //  focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.lightRed, width: 1),
      ),
      errorStyle: TextStyle(color: AppColors.lightRed),

      // border when error
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.lightRed, width: 1),
      ),

      // hint and label
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintStyle: TextStyle(color: AppColors.grey),
      labelStyle: TextStyle(color: AppColors.darkGrey),
      contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 16),

      // border
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.blackShade, width: 1.3),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.blackShade, width: 1.3),
      ),
      // focusedBorder
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.blackShade, width: 1.6),
      ),
    ),
  );
}