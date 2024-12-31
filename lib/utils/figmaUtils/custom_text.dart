import 'package:flutter/material.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import 'package:get_test/utils/theme/theme.dart';


/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeMaterialIconsOutlinedPrimary =>
      lightTheme.textTheme.bodyLarge!.materialIconsOutlined.copyWith(
        color: lightTheme.colorScheme.primary,
      );
  static get bodyLargeOnPrimary => lightTheme.textTheme.bodyLarge!.copyWith(
        color: lightTheme.colorScheme.onPrimary,
      );
  static get bodyMediumBlack900 => lightTheme.textTheme.bodyMedium!.copyWith(
        color: PrimaryColors.black900,
        fontSize: 13.fSize,
      );
  static get bodyMediumGray500 => lightTheme.textTheme.bodyMedium!.copyWith(
        color: PrimaryColors.gray500,
      );
  static get bodyMediumGray600 => lightTheme.textTheme.bodyMedium!.copyWith(
        color: PrimaryColors.gray600,
        fontSize: 13.fSize,
      );
  static get bodyMediumGray60001 => lightTheme.textTheme.bodyMedium!.copyWith(
        color: PrimaryColors.gray60001,
      );
  static get bodyMediumGray700 => lightTheme.textTheme.bodyMedium!.copyWith(
        color: PrimaryColors.gray700,
      );
  static get bodyMediumGray800 => lightTheme.textTheme.bodyMedium!.copyWith(
        color: PrimaryColors.gray800,
      );
  static get bodyMediumLightblue900 =>
      lightTheme.textTheme.bodyMedium!.copyWith(
        color: PrimaryColors.lightBlue900,
      );
  static get bodyMediumOnPrimary => lightTheme.textTheme.bodyMedium!.copyWith(
        color: lightTheme.colorScheme.onPrimary,
        fontSize: 13.fSize,
      );
  static get bodyMediumPoppinsff757575 =>
      lightTheme.textTheme.bodyMedium!.poppins.copyWith(
        color: const Color(0XFF757575),
      );
  static get bodyMediumff757575 => lightTheme.textTheme.bodyMedium!.copyWith(
        color: const Color(0XFF757575),
      );
  // Display text style
  static get displayMediumMaterialIconsOnPrimaryContainer =>
      lightTheme.textTheme.displayMedium!.materialIcons.copyWith(
        color: lightTheme.colorScheme.onPrimaryContainer,
        fontSize: 40.fSize,
        fontWeight: FontWeight.w400,
      );
  // Headline text style
  static get headlineLargeLightblue900 =>
      lightTheme.textTheme.headlineLarge!.copyWith(
        color: PrimaryColors.lightBlue900,
      );
  static get headlineLargeMaterialIconsOutlinedPrimary =>
      lightTheme.textTheme.headlineLarge!.materialIconsOutlined.copyWith(
        color: lightTheme.colorScheme.primary,
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallDeeporange300 =>
      lightTheme.textTheme.headlineSmall!.copyWith(
        color: PrimaryColors.deepOrange300,
      );
  static get headlineSmallGray600 =>
      lightTheme.textTheme.headlineSmall!.copyWith(
        color: PrimaryColors.gray600,
      );
  static get headlineSmallMaterialIconsOutlined =>
      lightTheme.textTheme.headlineSmall!.materialIconsOutlined;
  static get headlineSmallMaterialIconsOutlinedGray500 =>
      lightTheme.textTheme.headlineSmall!.materialIconsOutlined.copyWith(
        color: PrimaryColors.gray500,
      );
  static get headlineSmallMaterialIconsOutlinedGray800 =>
      lightTheme.textTheme.headlineSmall!.materialIconsOutlined.copyWith(
        color: PrimaryColors.gray800,
      );
  static get headlineSmallMaterialIconsOutlinedRedA700 =>
      lightTheme.textTheme.headlineSmall!.materialIconsOutlined.copyWith(
        color: PrimaryColors.redA700,
      );
  static get headlineSmallOnPrimary =>
      lightTheme.textTheme.headlineSmall!.copyWith(
        color: lightTheme.colorScheme.onPrimary,
      );
  static get headlineSmallOnPrimaryContainer =>
      lightTheme.textTheme.headlineSmall!.copyWith(
        color: lightTheme.colorScheme.onPrimaryContainer,
      );
  static get headlineSmallProductSansGray800 =>
      lightTheme.textTheme.headlineSmall!.productSans.copyWith(
        color: PrimaryColors.gray800,
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallSecondaryContainer =>
      lightTheme.textTheme.headlineSmall!.copyWith(
        color: lightTheme.colorScheme.secondaryContainer,
      );
  // Label text style
  static get labelLargeGray600 => lightTheme.textTheme.labelLarge!.copyWith(
        color: PrimaryColors.gray600,
      );
  static get labelLargeLightblue900 =>
      lightTheme.textTheme.labelLarge!.copyWith(
        color: PrimaryColors.lightBlue900,
        fontSize: 12.fSize,
      );
  static get labelLargeLightblue900_1 =>
      lightTheme.textTheme.labelLarge!.copyWith(
        color: PrimaryColors.lightBlue900,
      );
  static get labelLargeOnPrimary => lightTheme.textTheme.labelLarge!.copyWith(
        color: lightTheme.colorScheme.onPrimary,
        fontSize: 12.fSize,
      );
  static get labelLargeOnPrimaryContainer =>
      lightTheme.textTheme.labelLarge!.copyWith(
        color: lightTheme.colorScheme.onPrimaryContainer,
        fontSize: 12.fSize,
      );
  static get labelLargePrimary => lightTheme.textTheme.labelLarge!.copyWith(
        color: lightTheme.colorScheme.primary,
        fontSize: 12.fSize,
      );
  static get labelLargeSecondaryContainer =>
      lightTheme.textTheme.labelLarge!.copyWith(
        color: lightTheme.colorScheme.secondaryContainer,
        fontSize: 12.fSize,
      );
  // Title text style
  static get titleSmallDeeporange300 =>
      lightTheme.textTheme.titleSmall!.copyWith(
        color: PrimaryColors.deepOrange300,
      );
  static get titleSmallGray500 => lightTheme.textTheme.titleSmall!.copyWith(
        color: PrimaryColors.gray500,
      );
  static get titleSmallGray600 => lightTheme.textTheme.titleSmall!.copyWith(
        color: PrimaryColors.gray600,
      );
  static get titleSmallLightblue900 =>
      lightTheme.textTheme.titleSmall!.copyWith(
        color: PrimaryColors.lightBlue900,
      );
  static get titleSmallOnPrimary => lightTheme.textTheme.titleSmall!.copyWith(
        color: lightTheme.colorScheme.onPrimary,
      );
  static get titleSmallOnPrimaryContainer =>
      lightTheme.textTheme.titleSmall!.copyWith(
        color: lightTheme.colorScheme.onPrimaryContainer,
      );
  static get titleSmallPrimary => lightTheme.textTheme.titleSmall!.copyWith(
        color: lightTheme.colorScheme.primary,
      );
  static get titleSmallff757575 => lightTheme.textTheme.titleSmall!.copyWith(
        color: const Color(0XFF757575),
      );
}

extension on TextStyle {
  TextStyle get materialIconsOutlined {
    return copyWith(
      fontFamily: 'Material Icons Outlined',
    );
  }

  TextStyle get productSans {
    return copyWith(
      fontFamily: 'Product Sans',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get materialIcons {
    return copyWith(
      fontFamily: 'Material Icons',
    );
  }
}
