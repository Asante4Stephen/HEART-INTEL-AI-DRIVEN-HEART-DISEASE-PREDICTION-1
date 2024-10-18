import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  hintColor: AppColors.accentColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  cardColor: AppColors.cardColor,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: AppColors.lightTextColor,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.lightTextColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      color: AppColors.textColor,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.whiteColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    labelStyle: const TextStyle(
      color: AppColors.textColor,
      fontFamily: 'Poppins',
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: const TextStyle(
        fontFamily: 'Poppins',
        color: AppColors.whiteColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.primaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    titleTextStyle: TextStyle(
      fontFamily: 'Poppins',
      color: AppColors.whiteColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(
      color: AppColors.whiteColor,
    ),
  ),
);
