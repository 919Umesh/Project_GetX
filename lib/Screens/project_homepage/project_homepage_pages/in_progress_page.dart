import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get_test/Screens/project_homepage/project_homepage_pages/project_homepage_wrapper_getX.dart';

class InProgressProject extends GetView<ProjectHomepageWrapperGetX> {
  const InProgressProject({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
          );
        } else {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            itemCount: controller.projectList.length,
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey.shade300,
              height: 1,
            ),
            itemBuilder: (context, index) {
              final project = controller.projectList[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple.shade100,
                    child: const Icon(
                      Icons.person,
                      color: Colors.deepPurple,
                    ),
                  ),
                  title: Text(
                    project.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    project.location,
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    // Haptic feedback could be added here
                    Fluttertoast.showToast(
                      msg: project.name,
                      backgroundColor: Colors.black87,
                      textColor: Colors.white,
                    );
                  },
                ),
              );
            },
          );
        }
      }),
    );
  }
}
