import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/Screens/homepage/managerpages/projectpages/projectdetails/project_detail_wrapper_getx.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import '../../../../../Helper/get_routes.dart';
import '../../../../reusable/icon_button_b.dart';
import '../../../../reusable/snackbar_custom.dart';

class ProjectInventoryList extends GetView<ProjectDetailWrapperGetx> {
  const ProjectInventoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 24.adaptSize,
          ),
          const Text(
            "Design Estimate & Construction of residential building at anamnagar, kathmandu.",
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Get.toNamed(Routes.projectReportDetailPage,arguments: {'projectId': 123}),
                  child: Container(
                      height: 52.adaptSize,
                      margin: const EdgeInsets.only(bottom: 12),
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
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 6,
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16))),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Expanded(
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Cement dawd awd awd aw dwa ddwa dawd aw daw ",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff475467),
                                    ),
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "June 2, 2023",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff979797),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "(Stock)",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.secondary),
                                        maxLines: 1,
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Text(
                            "100 Pcs",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                              height: 17 / 14,
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      )),
                );
              },
            ),
          ),
          SizedBox(
            height: 10.adaptSize,
          ),
          Row(
            children: [
              CustomIconButtonF(
                text: 'Export Inventory',
                onPressed: () {
                  showCustomSnackbar(
                    title: "Feature not available",
                    message: "Work in progress",
                  );
                },
                icon: Icons.download,
              ),
              const SizedBox(
                width: 8,
              ),
              CustomIconButtonB(
                text: 'Add to Inventory',
                onPressed: () {
                  Get.toNamed(Routes.createInventory);
                },
                icon: Icons.add,
              )
            ],
          ),
          SizedBox(
            height: 49.adaptSize,
          )
        ],
      ),
    );
  }
}
