import 'package:flutter/material.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';


import 'icon_button_b.dart';

class CustomDraggableInfo extends StatelessWidget {
  final String text;
  final String bodytext;

  final Widget? midChild;

  final String buttonText1;
  final Color textcolor;
  final VoidCallback onPressed1;
  final double initialheight;
  final double maxheight;
  final double minlheight;

  const CustomDraggableInfo(
      {super.key,
      required this.text,
      required this.bodytext,
      required this.buttonText1,
      required this.onPressed1,
      this.textcolor = AppColors.black,
      this.initialheight = 0.5,
      this.maxheight = 0.90,
      this.minlheight = 0.3,
      this.midChild});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialheight,
      minChildSize: minlheight,
      maxChildSize: maxheight,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28.0),
              topRight: Radius.circular(28.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15.0),
                Center(
                  child: Container(
                    width: 52.adaptSize,
                    height: 6.adaptSize,
                    decoration: const BoxDecoration(
                      color: AppColors.mediumGrey,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                SizedBox(height: 25.adaptSize),
                midChild ?? const SizedBox(),
                SizedBox(height: 15.adaptSize),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: textcolor,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8.0),
                Text(
                  bodytext,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff475467),
                    // height: 34 / 12,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 15.0.adaptSize),
                Center(
                  child: CustomIconButtonB(
                      text: buttonText1, onPressed: onPressed1),
                ),
                SizedBox(height: 15.0.adaptSize),
              ],
            ),
          ),
        );
      },
    );
  }
}
