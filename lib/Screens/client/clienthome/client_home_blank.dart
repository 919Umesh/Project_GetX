import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/Screens/client/clienthome/client_home_getx.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';


import '../../reusable/bottom_draggable_info.dart';
import '../../reusable/bottom_snackbar_custom.dart';
import '../../reusable/icon_button_b.dart';

class ClientHomeBlank extends GetView<ClientHomeGetx> {
  const ClientHomeBlank({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 128.adaptSize,
            child: Image.asset('assets/images/nofile.png'),
          ),
          const Text(
            "No available report",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xff475467),
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            "You can request project creator for the report ",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff667085),
              height: 17 / 14,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 140.adaptSize,
          ),
          Obx(() {
            return SizedBox(
              width: double.maxFinite,
              child: CustomIconButtonB(
                color: controller.requestButtonDisabled.value
                    ? Colors.grey.shade400
                    : AppColors.primary,
                onPressed: () {
                  controller.requestButtonDisabled.value
                      ? () {}
                      : showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return CustomDraggableSnackbar(
                              text: "Do you want to send update request?",
                              bodytext:
                                  "Project manager will be notified about your requested.",
                              midChild: const SizedBox(),
                              buttonText1: 'Cancel',
                              onPressed1: () {
                                Get.back();
                              },
                              buttonText2: 'Request',
                              onPressed2: () {
                                controller.requestButtonDisabled(true);
                                Get.back();
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (BuildContext context) {
                                    return CustomDraggableInfo(
                                      initialheight: 0.35,
                                      text: "Request Sent Successfully",
                                      bodytext: "",
                                      midChild: const Center(
                                          child: Icon(
                                        Icons.check_circle_rounded,
                                        size: 68,
                                        color: AppColors.primary,
                                      )),
                                      buttonText1: 'Okay',
                                      onPressed1: () {
                                        Get.back();
                                      },
                                    );
                                  },
                                );
                              },
                            );
                          },
                        );
                },
                text: controller.requestButtonDisabled.value
                    ? "Already Requested"
                    : "Request a report",
                icon: Icons.send,
              ),
            );
          }),
          SizedBox(
            height: 12.adaptSize,
          ),
          SizedBox(
            width: double.maxFinite,
            child: CustomIconButtonF(
              onPressed: () {},
              text: "Contact Project Creator",
              icon: Icons.call,
            ),
          ),
        ],
      ),
    );
  }
}
