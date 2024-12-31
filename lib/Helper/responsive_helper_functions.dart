// ignore: avoid_classes_with_only_static_members
import 'package:flutter/widgets.dart';

class ResponsiveSizeMaker {
  static double makeResponSiveWidth({
    required double? sizeFromDesign,
    required BuildContext? context,
  }) {
    final double myScreenWidth = MediaQuery.of(context!).size.width;
    final sizePercentage = sizeFromDesign! * 100 / 414;
    final double responsiveSize = sizePercentage * myScreenWidth / 100;

    return responsiveSize;
  }

  static double makeResponSiveHeight({
    required double? sizeFromDesign,
    required BuildContext? context,
  }) {
    final doublemyScreenHeight = MediaQuery.of(context!).size.height;
    final double sizePercentage = sizeFromDesign! * 100 / 812;
    final double responsiveSize = doublemyScreenHeight * sizePercentage / 100;

    return responsiveSize;
  }
}
