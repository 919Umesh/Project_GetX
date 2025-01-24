import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../project_homepage/project_homepage_controller.dart';

import 'icon_button_b.dart';

class CustomTabButtonH extends GetView<ProjectHomepageController> {
  final String text;
  final int index;

  const CustomTabButtonH({super.key, required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.selectedTab.value == index
          ? CustomIconButtonB(
              onPressed: () => controller.changeTab(index),
              text: text,
              borderRadius: 80,
            )
          : CustomIconButtonF(
              onPressed: () => controller.changeTab(index),
              text: text,
              borderRadius: 80,
            ),
    );
  }
}

class CustomTabButtonProj extends GetView<ProjectHomepageController> {
  final String text;
  final int index;

  const CustomTabButtonProj(
      {super.key, required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.selectedTab.value == index
          ? CustomIconButtonB(
              onPressed: () => controller.changeTab(index),
              text: text,
              borderRadius: 80,
            )
          : CustomIconButtonF(
              onPressed: () => controller.changeTab(index),
              text: text,
              borderRadius: 80,
            ),
    );
  }
}


class CustomTabButtonProjectHome extends GetView<ProjectHomepageController> {
  final String text;
  final int index;

  const CustomTabButtonProjectHome({super.key, required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => controller.selectedTab.value == index
          ? CustomIconButtonB(
        onPressed: () => controller.changeTab(index),
        text: text,
        borderRadius: 80,
      )
          : CustomIconButtonF(
        onPressed: () => controller.changeTab(index),
        text: text,
        borderRadius: 80,
      ),
    );
  }
}
