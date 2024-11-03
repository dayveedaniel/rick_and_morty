import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const fontFamily = 'Lato';

  static const subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static const body1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static const body2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
  static const caption1 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static const caption2 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
}
