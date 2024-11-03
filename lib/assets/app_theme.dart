import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task/assets/text_styles.dart';

import 'app_colors.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.whiteSmoke,
  fontFamily: AppTextStyles.fontFamily,
  primaryColor: AppColors.irishBlue,
  iconTheme: const IconThemeData(color: AppColors.white),
  cupertinoOverrideTheme: const CupertinoThemeData(
    primaryColor: AppColors.nero,
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(
        color: AppColors.nero,
        fontFamily: AppTextStyles.fontFamily,
      ),
    ),
  ),
  // primaryTextTheme: TextTheme(),
  // textTheme: const TextTheme(
  //   headlineLarge: AppTextStyles.subtitle
  // ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.whiteSmoke,
  ),
);
