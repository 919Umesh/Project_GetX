import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide FormData, Response;
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import '../../Helper/constants.dart';
import '../reusable/icon_button_b.dart';
import 'create_customer_getX.dart';
import 'create_customer_repo.dart';
import 'package:dio/dio.dart' as d;

class CreateCustomerPage extends GetView<CreateCustomerController> {
  const CreateCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildCustomerForm(context),
              SizedBox(height: 20.adaptSize),
              _buildSaveButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  FormBuilder _buildCustomerForm(BuildContext context) {
    return FormBuilder(
      key: controller.formKeyCustomer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField(
            context,
            label: 'name',
            initialValue: 'Samsung',
            name: 'name',
            validator: (value) =>
            value == null || value.isEmpty ? 'Please enter a valid name.' : null,
          ),
          SizedBox(height: 20.adaptSize),
          _buildTextField(
            context,
            label: 'email',
            initialValue: 'testrohit45@gmail.com',
            name: 'email',
            validator: (value) =>
            value == null || value.isEmpty ? 'Please enter a valid email.' : null,
          ),
          const SizedBox(height: 10),
          _buildTextField(
            context,
            label: 'password',
            initialValue: 'global@8848',
            name: 'password',
            validator: (value) =>
            value == null || value.isEmpty ? 'Please enter a valid password.' : null,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      BuildContext context, {
        required String label,
        required String name,
        required String initialValue,
        required String? Function(String?)? validator,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        FormBuilderTextField(
          initialValue: initialValue,
          name: name,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.maxFinite,
      height: 55.adaptSize,
      child: CustomIconButtonB(
        onPressed: _saveForm,
        text: 'Save Project',
      ),
    );
  }

  Future<void> _saveForm() async {
    try {
      if (controller.formKeyCustomer.currentState!.saveAndValidate()) {
        try {
          d.Response response = await createCustomerRepository.createCustomer(d.FormData.fromMap(controller.formKeyCustomer.currentState!.value,),);
          if (response.statusCode == 201 || response.statusCode == 200) {
            Fluttertoast.showToast(msg: 'Success');
          } else {
            Get.snackbar(
              'Error',
              'Failed to create product',
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        } catch (e) {
          Get.snackbar(
            'Error',
            'An error occurred: ${e.toString()}',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    } catch (e) {
      _showCatchMessage(e.toString());
    }
  }
  void _showCatchMessage(String e) {
    Get.snackbar(
      'Error',
      e,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
}

