import 'package:flutter/material.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import 'icon_button_b.dart';

class CustomDraggableSnackbar extends StatelessWidget {
  final String text;
  final String bodytext;
  final Widget midChild;
  final String buttonText1;
  final VoidCallback onPressed1;
  final String buttonText2;
  final VoidCallback onPressed2;

  const CustomDraggableSnackbar({
    super.key,
    required this.text,
    required this.bodytext,
    required this.midChild,
    required this.buttonText1,
    required this.onPressed1,
    required this.buttonText2,
    required this.onPressed2,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.3,
      maxChildSize: 0.3,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28.0),
              topRight: Radius.circular(28.0),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(height: 15.0),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff475467),
                      height: 17 / 14,
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
                  const SizedBox(height: 8.0),
                  midChild,
                  SizedBox(height: 40.0.adaptSize),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: CustomIconButtonF(
                              text: buttonText1, onPressed: onPressed1)),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: CustomIconButtonB(
                              text: buttonText2, onPressed: onPressed2))
                    ],
                  ),
                  SizedBox(height: 32.0.adaptSize),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
