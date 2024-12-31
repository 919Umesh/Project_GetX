import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/Screens/homepage/managerpages/projectpages/projectdetails/project_detail_page.dart';
import 'package:get_test/Screens/reusable/custom_tab_switc.dart';
import '../../../../reusable/appbar_login.dart';
import 'inventory_list.dart';
import 'project_detail_wrapper_getx.dart';
import 'project_reports_list.dart';

class ProjectDetailWrapper extends GetView<ProjectDetailWrapperGetx> {
  const ProjectDetailWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: const CustomAppBarHome(
          title: "Project Details",
        ),
        body: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomTabButtonProj(text: 'Reports', index: 0),
                    CustomTabButtonProj(text: 'Inventory', index: 1),
                    CustomTabButtonProj(text: 'Details', index: 2),
                  ],
                ),
                Expanded(
                    child: PageView(
                  controller: controller.pageController,
                  onPageChanged: controller.changeTab,
                  children: const [
                    ProjectReportsList(),
                    ProjectInventoryList(),
                    ProjectDetailPage(),
                  ],
                )),
              ],
            )));
  }
}
