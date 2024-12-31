import 'package:flutter/material.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import '../../Helper/constants.dart';

class CustomDraggableEmpty extends StatelessWidget {
  const CustomDraggableEmpty(
      {super.key,
      required this.childWidget,
      this.initialheight = 0.5,
      this.maxheight = 0.90,
      this.minlheight = 0.3});

  final Widget childWidget;
  final double initialheight;
  final double maxheight;
  final double minlheight;

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
            child: Column(
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
                childWidget,
              ],
            ));
      },
    );
  }
}
