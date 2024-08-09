import 'package:flutter/material.dart';
import 'package:niaxtumobile/core/utils/size_utils.dart';
import 'package:niaxtumobile/theme/theme_helper.dart';

class AppDecoration {
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray100,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA70001,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: appTheme.whiteA700,
      );

  static BoxDecoration get outlineDeepPurpleA => BoxDecoration();
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: appTheme.lightBlue400,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              1,
            ),
          )
        ],
      );
  static BoxDecoration get outlinePrimary1 => BoxDecoration(
        color: appTheme.gray50,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(0, 1),
          ),
        ],
      );
}

class BorderRadiusStyle {
  static BorderRadius get circleBorder42 => BorderRadius.circular(
        42.h,
      );
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder22 => BorderRadius.circular(
        22.h,
      );
  static BorderRadius get roundedBorder6 => BorderRadius.circular(
        6.h,
      );
  static BorderRadius get roundedBorder73 => BorderRadius.circular(
        73.h,
      );
}
