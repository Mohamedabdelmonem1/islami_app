import 'package:flutter/material.dart';
import 'package:islami_app_route/core/app_colors.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryLightColor,
    canvasColor: AppColors.primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.blackColor),
      elevation: 0,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.blackColor,
      selectedIconTheme: IconThemeData(size: 30),
      unselectedIconTheme: IconThemeData(size: 30),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.blackColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColors.blackColor,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        color: AppColors.blackColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.darkColor,
      canvasColor: AppColors.yellow,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: AppColors.primaryLightColor,
        selectedIconTheme: IconThemeData(
          color: AppColors.yellow,
          size: 36,
        ),
        selectedLabelStyle: TextStyle(color: AppColors.yellow),
        selectedItemColor: AppColors.yellow,
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
          size: 24,
        ),
      ),
      textTheme:const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 30,
          color: AppColors.whiteColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 25,
          color: AppColors.whiteColor,
        ),
        bodySmall: TextStyle(
          fontSize: 20,
          color: AppColors.whiteColor,
        ),
      ),
      cardColor: AppColors.darkColor);
}
