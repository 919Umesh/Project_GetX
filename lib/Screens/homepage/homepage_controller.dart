import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageAdminController extends GetxController {
  var selectedTab = 0.obs;
  PageController pageController = PageController();

  void changeTab(int index) {
    selectedTab.value = index;
    pageController.jumpToPage(index);
  }
}
