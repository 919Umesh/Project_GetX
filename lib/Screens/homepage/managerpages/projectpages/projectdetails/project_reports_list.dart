import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/Screens/homepage/managerpages/projectpages/projectdetails/project_detail_wrapper_getx.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import '../../../../../Helper/get_routes.dart';
import '../../../../reusable/icon_button_b.dart';

class ProjectReportsList extends GetView<ProjectDetailWrapperGetx> {
  const ProjectReportsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomIconButtonB(
        onPressed: () {
          Get.toNamed(Routes.createReport);
        },
        text: 'Add Report',
        icon: Icons.add,
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: Column(
        children: [
          SizedBox(
            height: 24.adaptSize,
          ),
          const Text(
            "Design Estimate & Construction",
            style: TextStyle(
                fontFamily: "Inter",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.darkGrey),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Get.toNamed(Routes.projectReportDetailPage),
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(207, 199, 192, 192),
                              offset: Offset(0, 1),
                              blurRadius: 4.0,
                              spreadRadius: 1.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(12)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Report for july 7",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff475467),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Kathmandu",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff8c8e98),
                            ),
                            maxLines: 3,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      )),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
