import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/Screens/homepage/managerpages/projectpages/projectdetails/project_detail_wrapper_getx.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';


import '../../../../reusable/appbar_login.dart';

class ProjectReportDetailPage extends GetView<ProjectDetailWrapperGetx> {
  const ProjectReportDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    var projectId = arguments['projectId'];
    Fluttertoast.showToast(msg: projectId);
    return Scaffold(
      appBar: const CustomAppBarHome(
        title: "Report Detail",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 24.adaptSize,
            ),
            SizedBox(
              height: 278.adaptSize,
              width: 370.adaptSize,
              child: Swiper(
                itemWidth: double.maxFinite,
                outer: true,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.amber,
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/logo.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  );
                },
                itemCount: 3,
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
                autoplay: true,
              ),
            ),
            Obx(() {
              return AnimatedContainer(
                  duration: const Duration(milliseconds: 1500),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Report of June 21, Monday",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkGrey),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxHeight: controller.seeMoreDes.value
                                ? double.maxFinite
                                : 65,
                            minHeight: 30),
                        child: const Text(
                          " work today ais is the dy achhtachmoachhtachmork today ais is tachhtachmork today ais is the dy atThis is thtachmentsachhtachmork today ais is the dy atThis is thtachmentshe dy atThis is thtachmentsachhtachmork today ais is the dy atThis is thtachmentsachhtachmork today ais is the dy atThis is thtachmentsThis is thtachmentsrk today ais is the dy atThis is thtachmentsatThis is thtachhtachmork today aachhtachmork today ais is the dy atThis is thtachmentsis is the dy atThis is thtachments.",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff667085),
                          ),
                          // overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            controller.seeMoreDes.value
                                ? controller.seeMoreDes(false)
                                : controller.seeMoreDes(true);
                          },
                          child: Text(
                            controller.seeMoreDes.value
                                ? 'See Less ↖'
                                : 'See more ↘',
                            style: const TextStyle(color: AppColors.primary),
                          ),
                        ),
                      )
                    ],
                  ));
            }),
          ],
        ),
      ),
    );
  }
}
