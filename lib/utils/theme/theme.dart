import 'package:flutter/material.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';


ThemeData lightTheme = ThemeData(
  fontFamily: 'inter',
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: ColorSchemes.primaryColorScheme,
  visualDensity: VisualDensity.standard,
  // textTheme: TextThemes.textTheme(ColorSchemes.primaryColorScheme),
  scaffoldBackgroundColor: AppColors.backgroundColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: ColorSchemes.primaryColorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        padding: EdgeInsets.zero,
        textStyle: const TextStyle(color: AppColors.white)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(08.0),
        borderSide: const BorderSide(color: AppColors.lightGrey)),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.transparent,
      side: BorderSide(
        color: PrimaryColors.gray800,
        width: 1.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.h),
      ),
      // visualDensity: const VisualDensity(
      //   vertical: -4,
      //   horizontal: -4,
      // ),
      padding: const EdgeInsets.all(6),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorSchemes.primaryColorScheme.primary,
  ),
  dividerTheme: DividerThemeData(
    thickness: 1,
    space: 6,
    color: PrimaryColors.blueGray100,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ElevatedButton.styleFrom(
        splashFactory: InkSplash.splashFactory,
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: const TextStyle(color: AppColors.white)),
  ),
  datePickerTheme: DatePickerThemeData(
    cancelButtonStyle: ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll(Colors.black12),
      textStyle: WidgetStateProperty.all(
        const TextStyle(color: Colors.black), // Cancel button text color
      ),
    ),
    confirmButtonStyle: ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll(Colors.black12),
      textStyle: WidgetStateProperty.all(
        const TextStyle(color: Colors.black), // Cancel button text color
      ),
    ),
  ),

  timePickerTheme: TimePickerThemeData(
    hourMinuteColor: AppColors.primary,
    timeSelectorSeparatorColor: const WidgetStatePropertyAll(Colors.black),
    cancelButtonStyle: ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll(Colors.black12),
      textStyle: WidgetStateProperty.all(
        const TextStyle(color: Colors.black), // Cancel button text color
      ),
    ),
    confirmButtonStyle: ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll(Colors.black12),
      textStyle: WidgetStateProperty.all(
        const TextStyle(color: Colors.black), // Cancel button text color
      ),
    ),
  ),
);

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme(
    // Primary colors
    primary: AppColors.primary, // Set primary color to AppColors.primary
    primaryContainer: AppColors.white,
    // Adjust as needed for primary container
    secondary: AppColors.secondary,

    secondaryContainer: AppColors.black,

    // Surface and background
    surface: AppColors.white,
    onSurface: AppColors.black,

    // Error colors
    error: Colors.red,
    onError: AppColors
        .white, // Ensure error text color is visible on the error background

    // Brightness
    onPrimary: AppColors.white,
    onSecondary: AppColors.white,
    brightness: Brightness.light,
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  //white
  static Color get white900 => const Color(0XFFFFFFFF);

  // Black
  static Color get black900 => const Color(0XFF000000);

  // Blue
  static Color get blue50 => const Color(0XFFE5F3F7);
  static Color get blueA200 => const Color(0XFF518EF8);
  static Color get bluelight => const Color(0XFF299CC0);

  // BlueGray
  static Color get blueGray100 => const Color(0XFFD7D7D7);
  static Color get blueGray50 => const Color(0XFFEDF0F5);

  // DeepOrange
  static Color get deepOrange300 => const Color(0XFFFB7F65);

  // Gray
  static Color get gray100 => const Color(0XFFF5F5F5);
  static Color get gray300 => const Color(0XFFE6E6E6);
  static Color get gray500 => const Color(0XFF989898);
  static Color get gray600 => const Color(0XFF757575);
  static Color get gray60001 => const Color(0XFF7D7D7D);
  static Color get gray700 => const Color(0XFF616161);
  static Color get gray800 => const Color(0XFF484848);
  static Color get gray80001 => const Color(0XFF3C303E);

  // LightBlue
  static Color get lightBlue900 => const Color(0XFF0F6E9C);

  // Red
  static Color get redA200 => const Color(0XFFFF6262);
  static Color get redA700 => const Color(0XFFFF0F0F);

  //card gradient color
  static Color get cardbackGroundStart => const Color(0XFF0F6E9C);

  static Color get cardbackGroundEnd => const Color(0XFF83F8A6);
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: PrimaryColors.black900,
          fontSize: 18.fSize,
          fontFamily: 'Product Sans',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.secondaryContainer,
          fontSize: 14.fSize,
          fontFamily: 'Product Sans',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: PrimaryColors.redA200,
          fontSize: 12.fSize,
          fontFamily: 'Product Sans',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 44.fSize,
          fontFamily: 'Product Sans',
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 32.fSize,
          fontFamily: 'Product Sans',
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 24.fSize,
          fontFamily: 'Product Sans',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 15.fSize,
          fontFamily: 'Product Sans',
          fontWeight: FontWeight.w700,
        ),
        labelMedium: TextStyle(
          color: PrimaryColors.gray600,
          fontSize: 13.fSize,
          fontFamily: 'Product Sans',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: PrimaryColors.gray600,
          fontSize: 15.fSize,
          fontFamily: 'Product Sans',
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          color: PrimaryColors.gray800,
          fontSize: 15.fSize,
          fontFamily: 'Product Sans',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: PrimaryColors.gray800,
          fontSize: 18.fSize,
          fontFamily: 'Product Sans',
          fontWeight: FontWeight.w700,
        ),
      );
}
