import 'package:flutter/material.dart';
import 'package:testly/core/constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,

    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColors.textFieldBorderColor,
        fontSize: 20,
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
      ),
      elevation: 0,
      backgroundColor: AppColors.white,
    
      iconTheme: IconThemeData(color: AppColors.black, size: 24),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(decoration: TextDecoration.underline),
        foregroundColor: AppColors.blueBaseColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blueBaseColor,
        elevation: 0,
        disabledBackgroundColor: AppColors.disableButtonColor,
        foregroundColor: AppColors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // error label style
      floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return const TextStyle(color:AppColors.notValidColor);
        }
        return const TextStyle(color: AppColors.labelTextColor);
      }),
      //  focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.notValidColor, width: 1),
      ),
      errorStyle: TextStyle(color: AppColors.notValidColor),

      // border when error
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.notValidColor, width: 1),
      ),

      // hint and label
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintStyle: TextStyle(color: AppColors.hintTextColor),
      labelStyle: TextStyle(color: AppColors.labelTextColor),
      contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
  
      // border
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
      ),
   
      // foucsedBorder
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
      ),
    ),

  );
}
