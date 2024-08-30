import 'package:flutter/material.dart';
import 'package:niaxtumobile/core/utils/size_utils.dart';

String _appTheme = "lightCode";
LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable

class ThemeHelper {
// A map of custom color themes supported by the app
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

// A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Changes the app theme to [newTheme].
  void changeTheme(String newTheme) {
    _appTheme = newTheme;
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.lightBlue400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          shadowColor: colorScheme.primary,
          elevation: 1,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 18.fSize,
          fontFamily: 'Book Antiqua',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.onSecondaryContainer,
          fontSize: 14.fSize,
          fontFamily: 'Book Antiqua',
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 26.fSize,
          fontFamily: 'Book Antiqua',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 25.fSize,
          fontFamily: 'Book Antiqua',
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: appTheme.whiteA70001,
          fontSize: 20.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 16.fSize,
          fontFamily: 'Book Antiqua',
          fontWeight: FontWeight.w700,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
    primary: Color(0X3F000000),
    onPrimary: Color(0XFFF20A0A),
    onPrimaryContainer: Color(0XFF606060),
    onSecondaryContainer: Color(0XFF030303),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
// Black
  Color get black90001 => const Color(0XFF180606);
  Color get black90021 => const Color(0X21080707);
  Color get bluex => const Color(0XFF29B6F6);

// BlueGray
  Color get blueGray100 => const Color(0XFFD9D9D9);
  Color get blueGray400 => const Color(0XFF888888);
// DeepOrange
  Color get deepOrangeA200 => const Color(0XFFEE6B31);
  // DeepPurple
  Color get deepPurpleA200 => const Color(0XFF9747FF);
// Gray
  Color get gray10096 => const Color(0X96F4F4F4);
  Color get gray300 => const Color(0XFFE5E5E5);
  Color get gray400 => const Color(0XFFC4C4C4);
  Color get gray50 => const Color(0XFFFDFBFB);
  Color get gray500 => const Color(0XFFACABAB);
  Color get gray50001 => const Color(0XFF9C9C9C);
  Color get gray5002101 => const Color(0X21938F8F);
  Color get gray600 => const Color(0XFF817C7C);
  Color get gray60001 => const Color(0XFF807C7C);
// Green
  Color get greenA400 => const Color(0XFF29F656);
// LightBlue
  Color get lightBlue400 => const Color(0XFF29B6F6);
// Red
  Color get red500 => const Color(0XFFEA4335);
  Color get red200 => Colors.red.shade200;
// White
  Color get whiteA700 => const Color(0XFFFFFCFC);
  Color get whiteA70001 => const Color(0XFFFFFFFF);
}
