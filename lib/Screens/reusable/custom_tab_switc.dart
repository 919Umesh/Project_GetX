import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/Screens/homepage/homepage_controller.dart';
import 'package:get_test/Screens/homepage/managerpages/projectpages/projectdetails/project_detail_wrapper_getx.dart';
import '../project_homepage/project_homepage_controller.dart';
import '../project_homepage/project_homepage_pages/project_homepage_wrapper_getX.dart';
import 'icon_button_b.dart';

class CustomTabButtonH extends GetView<HomePageAdminController> {
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

class CustomTabButtonProj extends GetView<ProjectDetailWrapperGetx> {
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
