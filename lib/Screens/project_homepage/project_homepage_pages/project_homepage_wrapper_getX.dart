import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/Models/homepage_project_model.dart';
import 'package:get_test/Screens/project_homepage/project_homepage_pages/project_homepage_wrapper_repo.dart';

class ProjectHomepageWrapperGetX extends GetxController {
  RxBool seeMoreDes = false.obs;
  final isLoading = false.obs;
  final projectList = <ProjectModel>[].obs;

  final List<String> tabProjectStatus = [
    'in-progress',
    'pending',
    'complete',
  ];

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchProjectList(tabProjectStatus[0]);
  }
  Future<void> fetchProjectList(String status) async {
    isLoading.value = true;
    try {
      final model = await getProjectListRepository.getProject(status);
      if ( model.status == 200) {
        projectList.value =model.projects;
      } else {
        debugPrint('Error Occurred');
      }
    } catch (e) {
      debugPrint("Error fetching order report: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
