import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_test/Screens/project_homepage/search_project/search_project_repo.dart';
import '../../../Models/homepage_project_model.dart';

class ProjectSearchController extends GetxController {
  final isLoading = false.obs;
  final projectSearchList = <ProjectModel>[].obs;

  Future<void> searchProjects(String name) async {
    isLoading.value = true;
    try {
      final model = await projectSearchRepository.searchProjects(name);
      if (model.status == 200) {
        projectSearchList.value = model.projects;
      } else {
        projectSearchList.clear();
        debugPrint('Some error occurred');
      }
    } catch (e) {
      debugPrint("Error fetching projects: $e");
    } finally {
      isLoading.value = false;
    }
  }
  void clearSearchResults() {
    projectSearchList.clear();
  }
}