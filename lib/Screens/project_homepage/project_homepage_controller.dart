import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/Screens/project_homepage/project_homepage_pages/project_homepage_wrapper_getX.dart';

class ProjectHomepageController extends GetxController {
  var selectedTab = 0.obs;
  PageController pageController = PageController();
  RxBool seeMoreDes = false.obs;
  final wrapperController = Get.find<ProjectHomepageWrapperGetX>();

  void changeTab(int index) {
    selectedTab.value = index;
    pageController.jumpToPage(index);

    final String currentStatus = wrapperController.tabProjectStatus[index];
    wrapperController.fetchProjectList(currentStatus);
  }
}
