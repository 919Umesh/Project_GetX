import 'package:flutter/material.dart';
import 'package:get_test/Helper/constants.dart';


class CustomIconButtonB extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color color;
  final TextStyle? textStyle;
  final double spacing;
  final double borderRadius;

  const CustomIconButtonB(
      {super.key,
      required this.text,
      this.icon,
      required this.onPressed,
      this.color = AppColors.primary,
      this.textStyle = const TextStyle(
          color: Colors.white, fontSize: 14, fontFamily: 'roboto'),
      this.spacing = 8.0,
      this.borderRadius = 8});

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                side: const BorderSide(
                  color: AppColors.primary,
                  width: 1.0,
                ),
              ),
              backgroundColor: color,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: textStyle,
            ),
          )
        : TextButton.icon(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                side: BorderSide(
                  color: color,
                  width: 1.0,
                ),
              ),
              backgroundColor: color,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            ),
            onPressed: onPressed,
            iconAlignment: IconAlignment.end,
            icon: Icon(
              icon,
              color: AppColors.white,
            ),
            label: Text(
              text,
              style: textStyle,
            ),
          );
  }
}

class CustomIconButtonF extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color color;
  final TextStyle? textStyle;
  final double spacing;
  final double borderRadius;

  const CustomIconButtonF(
      {super.key,
      required this.text,
      this.icon,
      required this.onPressed,
      this.color = AppColors.primary,
      this.textStyle = const TextStyle(
          color: AppColors.primary, fontSize: 14, fontFamily: 'roboto'),
      this.spacing = 8.0,
      this.borderRadius = 8});

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                side: BorderSide(
                  color: color,
                  width: 1.0,
                ),
              ),
              backgroundColor: AppColors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: textStyle,
            ),
          )
        : TextButton.icon(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(
                  color: color,
                  width: 1.0,
                ),
              ),
              backgroundColor: AppColors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            ),
            onPressed: onPressed,
            iconAlignment: IconAlignment.start,
            icon: Icon(
              icon,
              color: AppColors.primary,
            ),
            label: Text(
              text,
              style: textStyle,
            ),
          );
  }
}
