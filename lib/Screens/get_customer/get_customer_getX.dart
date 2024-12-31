import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_test/Models/user_model.dart';
import 'get_customer_repo.dart';

class GetCustomerController extends GetxController {
  final isLoading = false.obs;
  RxBool seeMoreDes = false.obs;
  final userList = <UserModel>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchCustomerList();
  }

  Future<void> fetchCustomerList() async {
    isLoading.value = true;
    try {
      final model = await getCustomerRepository.getCustomer();
      if ( model.status == 200) {
        userList.value = model.users;
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
