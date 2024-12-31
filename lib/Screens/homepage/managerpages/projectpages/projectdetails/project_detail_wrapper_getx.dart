import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectDetailWrapperGetx extends GetxController {
  var selectedTab = 0.obs;
  PageController pageController = PageController();
  RxBool seeMoreDes = false.obs;

  void changeTab(int index) {
    selectedTab.value = index;
    pageController.jumpToPage(index);
  }
}
