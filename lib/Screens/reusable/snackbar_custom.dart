import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Helper/constants.dart';

void showCustomSnackbar({
  required String title,
  required String message,
  Color backgroundColor = AppColors.white,
  Color borderColor = AppColors.secondary,
  double borderWidth = 1.0,
  Duration duration = const Duration(seconds: 3),
}) {
  if (!Get.isSnackbarOpen) {
    Get.snackbar(title, message,
        backgroundColor: backgroundColor,
        borderWidth: borderWidth,
        borderColor: borderColor,
        duration: duration,
        margin: const EdgeInsets.all(4));
  }
}
