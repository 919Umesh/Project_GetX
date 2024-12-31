import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CreateProductController extends GetxController {
  final isLoading = false.obs;

  final formKeyProduct = GlobalKey<FormBuilderState>();
  void setLoading(bool value) {
    isLoading.value = value;
  }
}

