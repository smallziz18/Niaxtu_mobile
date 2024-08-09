import 'package:flutter/material.dart';
import 'package:niaxtumobile/core/utils/size_utils.dart';
import 'package:niaxtumobile/theme/theme_helper.dart';

extension on TextStyle {
  TextStyle get bookAntiqua {
    return copyWith(
      fontFamily: 'Book Antiqua',
    );
  }
}

class CustomTextStyles {
  static get bodyLarge16 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 16.fSize,
      );
  static get bodyLargeGray400 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray400,
        fontSize: 16.fSize,
      );
  static get bodyLargeGray600 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray600,
      );
  static get bodyLargeGray60001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray60001,
      );
  static get bodyLargeGray60016 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray600,
        fontSize: 16.fSize,
      );
  static get bodyLargeGray600_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray600,
      );
  static get bodyLargeRed500 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray500,
        fontSize: 16.fSize,
      );
  static get bodyLargeRed500_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyLargeWhiteA70001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA70001,
      );

  static get headlineMedium28 => theme.textTheme.headlineMedium!.copyWith(
        fontSize: 28.fSize,
      );
  static get headlineMediumBlack90001 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.black90001,
      );

  static get titleLargeBookAntiquaDeeporangeA200 =>
      theme.textTheme.titleLarge!.bookAntiqua.copyWith(
        color: appTheme.deepOrangeA200,
        fontWeight: FontWeight.w400,
      );

  static get titleLargeBookAntiquaGray600 =>
      theme.textTheme.titleLarge!.bookAntiqua.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w400,
      );

  static get titleLargeBookAntiquaGray60001 =>
      theme.textTheme.titleLarge!.bookAntiqua.copyWith(
        color: appTheme.gray60001,
        fontWeight: FontWeight.w400,
      );

  static get titleLargeBookAntiquaPrimary =>
      theme.textTheme.titleLarge!.bookAntiqua.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontWeight: FontWeight.w400,
      );

  static get titleLargeBookAntiquaPrimaryRegular =>
      theme.textTheme.titleLarge!.bookAntiqua.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontWeight: FontWeight.w400,
      );
  static get titleLargeGray400 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray400,
      );

  static get titleMediumBookAntiquaGray50001 =>
      theme.textTheme.titleMedium!.bookAntiqua.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w500,
      );

  static get titleMediumBookAntiquaGray600 =>
      theme.textTheme.titleMedium!.bookAntiqua.copyWith(
        color: appTheme.gray600,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );

  static get titleMediumBookAntiquaOnPrimaryContainer =>
      theme.textTheme.titleMedium!.bookAntiqua.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w500,
      );
}
