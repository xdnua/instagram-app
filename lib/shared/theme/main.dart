import 'package:flutter/material.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'AvertaStdCY',
    brightness: Brightness.light,
    primaryColor: ColorConstants.primaryBlue,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorConstants.primaryBlue,
    ).copyWith(error: ColorConstants.actionRed),
    scaffoldBackgroundColor: ColorConstants.backgroundWhite,
    textTheme: _textTheme,
    // appBarTheme: _appBarTheme,
    iconTheme: const IconThemeData(color: ColorConstants.primaryBlue),
    elevatedButtonTheme: _elevatedButtonTheme,
    bottomSheetTheme: _bottomSheetTheme,
    timePickerTheme: _timePickerTheme,
    pageTransitionsTheme: _pageTransitionsTheme,
  );

  static const TextTheme _textTheme = TextTheme(
    bodyLarge: AppTextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: ColorConstants.backgroundDark,
    ),
    bodyMedium: AppTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorConstants.backgroundDark,
    ),
    bodySmall: AppTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: ColorConstants.backgroundDark,
    ),
    displayLarge: TextStyle(
      fontWeight: FontWeight.w500,
      color: ColorConstants.backgroundDark,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.w500,
      color: ColorConstants.backgroundDark,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w500,
      color: ColorConstants.backgroundDark,
    ),
    titleLarge: AppTextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: ColorConstants.backgroundDark,
    ),
    titleMedium: AppTextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: ColorConstants.backgroundDark,
    ),
    titleSmall: AppTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorConstants.backgroundDark,
    ),
    headlineLarge: AppTextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: ColorConstants.backgroundDark,
    ),
    headlineMedium: AppTextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: ColorConstants.backgroundDark,
    ),
    headlineSmall: AppTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorConstants.backgroundDark,
    ),
    labelLarge: AppTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorConstants.backgroundDark,
    ),
    labelMedium: AppTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: ColorConstants.backgroundDark,
    ),
    labelSmall: AppTextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: ColorConstants.backgroundDark,
    ),
  );

  // static const AppBarTheme _appBarTheme = AppBarTheme(
  //   backgroundColor: ColorConstants.backgroundWhite,
  //   elevation: 0,
  //   iconTheme: IconThemeData(color: ColorConstants.backgroundDark),
  //   titleTextStyle: AppTextStyle(
  //     fontSize: 20,
  //     fontWeight: FontWeight.w500,
  //     color: ColorConstants.backgroundDark,
  //   ),
  // );

  static final ElevatedButtonThemeData _elevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.primaryBlue,
        ),
      );

  static const BottomSheetThemeData _bottomSheetTheme = BottomSheetThemeData(
    backgroundColor: ColorConstants.backgroundWhite,
    surfaceTintColor: ColorConstants.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
  );

  static const TimePickerThemeData _timePickerTheme = TimePickerThemeData(
    backgroundColor: ColorConstants.backgroundWhite,
    dialBackgroundColor: ColorConstants.backgroundWhite,
  );

  static const PageTransitionsTheme _pageTransitionsTheme =
      PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      );
}
