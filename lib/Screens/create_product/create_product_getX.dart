

// lib/features/product/controller/create_product_controller.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart' as d;
import 'package:http_parser/http_parser.dart';
import 'create_product_repo.dart';

class CreateProductController extends GetxController {
  final formKeyProduct = GlobalKey<FormBuilderState>();
  final Rx<XFile?> selectedImage = Rx<XFile?>(null);



  void updateSelectedImage(XFile? image) {
    selectedImage.value = image;
  }

  Future<void> saveProduct() async {
    try {
      if (formKeyProduct.currentState!.saveAndValidate()) {
        final Map<String, dynamic> formValues =
        Map.from(formKeyProduct.currentState!.value);

        // Format dates
        if (formValues['fromDate'] != null) {
          formValues['fromDate'] =
              DateFormat('yyyy-MM-dd').format(formValues['fromDate']);
        }
        if (formValues['toDate'] != null) {
          formValues['toDate'] =
              DateFormat('yyyy-MM-dd').format(formValues['toDate']);
        }

        debugPrint(selectedImage.value!.path);
        debugPrint('Form Values:');
        formValues.forEach((key, value) {
          if (value is d.MultipartFile) {
            debugPrint('$key: filename: ${value.filename}, contentType: ${value.contentType}');
          } else {
            debugPrint('$key: $value');
          }
        });


        final d.FormData formData = d.FormData.fromMap(formValues);
        final response = await createProductRepository.createProduct(formData: formData);

        if (response.statusCode == 201 || response.statusCode == 200) {
          Get.back();
          _showSuccessMessage('Product created successfully');
        } else {
          _showErrorMessage('Failed to create product');
        }
      }
    } catch (e) {
      debugPrint("Error saving product: $e");
      _showErrorMessage('An error occurred while saving the product');
    }
  }

  void _showSuccessMessage(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void _showErrorMessage(String message) {
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  void resetForm() {
    formKeyProduct.currentState?.reset();
    updateSelectedImage(null);
  }
}
