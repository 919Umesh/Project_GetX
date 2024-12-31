import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/Helper/get_routes.dart';
import 'package:get_test/Screens/project_homepage/project_homepage_controller.dart';
import 'package:get_test/Screens/project_homepage/project_homepage_pages/complete_page.dart';
import 'package:get_test/Screens/project_homepage/project_homepage_pages/in_progress_page.dart';
import 'package:get_test/Screens/project_homepage/project_homepage_pages/pending_page.dart';
import 'package:get_test/Screens/reusable/appbar_login.dart';
import 'package:get_test/Screens/reusable/custom_tab_switc.dart';
import 'package:get_test/Screens/reusable/icon_button_b.dart';

class ProjectHomepageAdmin extends GetView<ProjectHomepageController> {
  const ProjectHomepageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
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
                Get.toNamed(Routes.projectSearchPage);
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
          Get.toNamed(Routes.createProjectLocal);
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
                CustomTabButtonProjectHome(text: 'In-progress', index: 0),
                CustomTabButtonProjectHome(text: 'Pending', index: 1),
                CustomTabButtonProjectHome(text: 'Completed', index: 2),
              ],
            ),
            Expanded(
                child: PageView(
              controller: controller.pageController,
              onPageChanged: controller.changeTab,
              children: const [
                InProgressProject(),
                PendingProject(),
                ProjectCompleted(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
