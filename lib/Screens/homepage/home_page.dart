import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/Screens/homepage/managerpages/projectpages/iprojects_page_reusable.dart';
import 'package:get_test/Screens/reusable/custom_tab_switc.dart';
import 'package:get_test/Screens/reusable/icon_button_b.dart';
import '../../Helper/get_routes.dart';
import '../reusable/appbar_login.dart';
import 'homepage_controller.dart';

class HomePageAdmin extends GetView<HomePageAdminController> {
  const HomePageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: CustomAppBarHome(
          title: "",
          leading: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.managerProfile);
                },
                child: const CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.black,
                  foregroundImage: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: CustomIconButtonB(
          onPressed: () {
            Get.toNamed(Routes.createProjectPage);
          },
          text: 'Add Project',
          icon: Icons.add,
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        body: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomTabButtonH(text: 'In-progress', index: 0),
                    CustomTabButtonH(text: 'Completed', index: 1),
                    CustomTabButtonH(text: 'All projects', index: 2),
                  ],
                ),
                Expanded(
                    child: PageView(
                  controller: controller.pageController,
                  onPageChanged: controller.changeTab,
                  children: const [
                    ProjectsListPage(),
                    Center(child: Text('Page 2')),
                    Center(child: Text('Page 3')),
                  ],
                )),
              ],
            )));
  }
}
