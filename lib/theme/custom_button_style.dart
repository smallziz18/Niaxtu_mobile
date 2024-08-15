import 'package:flutter/material.dart';
import 'package:niaxtumobile/core/utils/size_utils.dart';
import 'package:niaxtumobile/theme/theme_helper.dart';

class CustomButtonStyles {
  static ButtonStyle get fillGray => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray10096,
      );

  static ButtonStyle get outlinePrimaryTL19 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.greenA400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19.h),
        ),
        shadowColor: theme.colorScheme.primary,
        elevation: 1,
      );

  static ButtonStyle get none => const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
        elevation: WidgetStatePropertyAll<double>(0),
      );
}
