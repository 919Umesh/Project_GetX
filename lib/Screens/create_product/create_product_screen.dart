import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/Screens/create_product/create_product_getX.dart';
import 'package:get_test/Screens/create_product/create_product_repo.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import 'package:dio/dio.dart' as d;
import '../reusable/icon_button_b.dart';

class CreateProductPage extends GetView<CreateProductController> {
  const CreateProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text('Create Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            FormBuilder(
              key: controller.formKeyProduct,
              child: Expanded(
                child: ListView(
                  children: [
                    buildTextField('GroupName', 'GroupName'),
                    buildTextField('DbName', 'DbName'),
                    buildTextField('SubGroupName', 'SubGroupName'),
                    buildTextField('ProductUnit', 'ProductUnit'),
                    buildTextField('ProductAltUnit', 'ProductAltUnit',isOptional: true),
                    buildTextField('SalesRate', 'SalesRate', isNumeric: true),
                    buildTextField('PurchaseRate', 'PurchaseRate', isNumeric: true),
                    buildTextField('ProductCode', 'ProductCode',isOptional: true),
                    buildTextField('ProductName', 'ProductName'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.maxFinite,
              height: 55.adaptSize,
              child: Obx(() => CustomIconButtonB(
                onPressed:_saveForm,
                text: controller.isLoading.value ? 'Saving...' : 'Save Product',
              )),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String name, String label, {bool isNumeric = false, bool isOptional = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          '$label *',
          style: Get.textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        FormBuilderTextField(
          name: name,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (!isOptional&&(value == null || value.trim().isEmpty)) {
              return 'Please enter a valid $label.';
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        ),
      ],
    );
  }
  _saveForm() async {
    try {
      d.Response response = await createProductRepository.createProduct(
          formData: d.FormData.fromMap(controller.formKeyProduct.currentState!.value));
      debugPrint(response.statusMessage);
      debugPrint(response.data.toString());
      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.back();
      } else {
        Get.snackbar(
          "Error",
          "Failed to save product.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          borderRadius: 10,
        );
      }
    } catch (e) {
     debugPrint(e.toString());
     Get.snackbar(
       "Error",
       "An error occurred. Please try again.",
       snackPosition: SnackPosition.TOP,
       backgroundColor: Colors.redAccent,
       colorText: Colors.white,
       margin: const EdgeInsets.all(10),
       borderRadius: 10,
     );
    }
    finally{
      controller.isLoading.value =false;
    }
  }
}
