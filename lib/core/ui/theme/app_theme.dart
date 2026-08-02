import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';
import 'package:testly/core/constants/app_constants.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: AppConstant.appFont,
    scaffoldBackgroundColor: AppColors.white,

    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColors.blackShade,
        fontSize: 20,
        fontFamily: AppConstant.appFont,
        fontWeight: FontWeight.w500,
      ),
      elevation: 0,
      backgroundColor: AppColors.white,
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
      contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
      labelStyle: TextStyle(color: AppColors.darkGrey),
      hintStyle: TextStyle(color: AppColors.grey),
      errorStyle: TextStyle(color: AppColors.lightRed),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return const TextStyle(color: AppColors.lightRed);
        }
        return const TextStyle(color: AppColors.darkGrey);
      }),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      errorBorder: (_defaultInputBorder as OutlineInputBorder).copyWith(
        borderSide: BorderSide(color: AppColors.lightRed, width: 1),
      ),
      focusedBorder: (_defaultInputBorder as OutlineInputBorder).copyWith(
        borderSide: BorderSide(color: AppColors.blackShade, width: 1.6),
      ),
      focusedErrorBorder: (_defaultInputBorder as OutlineInputBorder).copyWith(
        borderSide: BorderSide(color: AppColors.lightRed, width: 1),
      ),
    ),
  );

  static const InputBorder _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(color: AppColors.blackShade, width: 1.3),
  );
}
