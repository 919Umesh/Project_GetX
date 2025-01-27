import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/Screens/get_customer/get_customer_getX.dart';
import '../../Helper/get_routes.dart';
import '../../Helper/shared_preference_fun.dart';

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
      //Obx means the content are reactive
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
                    onTap: () async {
                      String userId = await SharedPreferencesHelper.getStringLocal('userID');
                      Get.toNamed(
                        Routes.chatScreen,
                        arguments: {
                          'senderID':userId,
                          'receiverID': user.id,
                          'username': user.name,
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
    );
  }
}