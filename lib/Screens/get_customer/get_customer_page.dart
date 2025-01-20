import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_test/Screens/get_customer/get_customer_getX.dart';

import '../../Helper/get_routes.dart';

class GetCustomerPage extends GetView<GetCustomerController> {
  const GetCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Customer List',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () => controller.fetchCustomerList(),
            color: Colors.deepPurple,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: controller.userList.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade300,
                height: 1,
              ),
              itemBuilder: (context, index) {
                final user = controller.userList[index];
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
                      user.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      user.email,
                      style: const TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Get.toNamed(
                        Routes.chatScreen,
                        arguments: {
                          'receiverID': user.id,
                        },
                      );
                    },
                  ),
                );
              },
            ),
          );
        }
      }),
     // body:  Obx(() {
     //    return AnimatedContainer(
     //        duration:
     //        const Duration(milliseconds: 1500),
     //        margin: const EdgeInsets.only(bottom: 12),
     //        padding: const EdgeInsets.all(8),
     //        decoration: BoxDecoration(
     //            color: Colors.white,
     //            boxShadow: const [
     //              BoxShadow(
     //                color: Color.fromARGB(207, 199, 192, 192),
     //                offset: Offset(0, 1),
     //                blurRadius: 4.0,
     //                spreadRadius: 1.0,
     //              )
     //            ],
     //            borderRadius:
     //            BorderRadius.circular(12)),
     //        child: Column(
     //          crossAxisAlignment:
     //          CrossAxisAlignment.start,
     //          children: [
     //            const Text(
     //              "Design Estimate & Construction of bridge",
     //              style: TextStyle(
     //                fontFamily: "Inter",
     //                fontSize: 14,
     //                fontWeight: FontWeight.w500,
     //                color: AppColors.black,
     //              ),
     //              textAlign: TextAlign.left,
     //            ),
     //            const SizedBox(
     //              height: 16,
     //            ),
     //            Container(
     //              constraints: BoxConstraints(
     //                  maxHeight:
     //                  controller.seeMoreDes.value
     //                      ? double.maxFinite
     //                      : 65,
     //                  minHeight: 30),
     //              child: const Text(
     //                " work today ais is the dy achhtachmoachhtachmork today ais is tachhtachmork today ais is the dy atThis is thtachmentsachhtachmork today ais is the dy atThis is thtachmentshe dy atThis is thtachmentsachhtachmork today ais is the dy atThis is thtachmentsachhtachmork today ais i work today ais is the dy achhtachmoachhtachmork today ais is tachhtachmork today ais is the dy atThis is thtachmentsachhtachmork today ais is the dy atThis is thtachmentshe dy atThis is thtachmentsachhtachmork today ais is the dy atThis is thtachmentsachhtachmork today ais is the dy atThis is thtachmentsThis is thtachmentsrk today ais is the dy atThis is thtachmentsatThis is thtachhtachmork today aachhtachmork today ais is the dy atThis is thtachmentsis is the dy atThis is thtachments.",
     //                style: TextStyle(
     //                  fontFamily: "Inter",
     //                  fontSize: 14,
     //                  fontWeight: FontWeight.w400,
     //                  color: Color(0xff667085),
     //                ),
     //                // overflow: TextOverflow.ellipsis,
     //                textAlign: TextAlign.left,
     //              ),
     //            ),
     //            const SizedBox(
     //              height: 12,
     //            ),
     //            Align(
     //              alignment: Alignment.bottomRight,
     //              child: InkWell(
     //                onTap: () {
     //                  controller.seeMoreDes.value
     //                      ? controller
     //                      .seeMoreDes(false)
     //                      : controller
     //                      .seeMoreDes(true);
     //                },
     //                child: Text(
     //                  controller.seeMoreDes.value
     //                      ? 'See Less ↖'
     //                      : 'See more ↘',
     //                  style: const TextStyle(
     //                      color: AppColors.primary),
     //                ),
     //              ),
     //            )
     //          ],
     //        ));
     //  }),
    );
  }
}