import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../Models/product_model.dart';
import 'get_product_repo.dart';

class GetProductController extends GetxController {
  final isLoading = false.obs;
  final productList = <ProductModel>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchProductList();
  }

  Future<void> fetchProductList() async {
    isLoading.value = true;
    try {
      final model = await getProductRepository.getProducts();
      if (model.status == 200) {
        productList.value = model.products;
      } else {
        debugPrint('Error Occurred');
      }
    } catch (e) {
      debugPrint("Error fetching product list: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
