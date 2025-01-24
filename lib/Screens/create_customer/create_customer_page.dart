import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart' hide FormData, Response;
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import '../../Helper/constants.dart';
import '../../Helper/get_routes.dart';
import '../reusable/icon_button_b.dart';
import 'create_customer_getX.dart';
import 'create_customer_repo.dart';

class CreateCustomerPage extends GetView<CreateCustomerController> {
  const CreateCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.getCustomer),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        actions: [
          IconButton(onPressed: (){
            Get.toNamed(Routes.getQuill);
          }, icon: const Icon(Icons.add))
        ],
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
            name: 'name',
            validator: (value) =>
            value == null || value.isEmpty ? 'Please enter a valid name.' : null,
          ),
          SizedBox(height: 20.adaptSize),
          _buildTextField(
            context,
            label: 'email',
            name: 'email',
            validator: (value) =>
            value == null || value.isEmpty ? 'Please enter a valid email.' : null,
          ),
          const SizedBox(height: 10),
          _buildTextField(
            context,
            label: 'password',
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
        //To parse the form data in the json data form
        final formData = {
          'name': controller.formKeyCustomer.currentState!.value['name'],
          'email': controller.formKeyCustomer.currentState!.value['email'],
          'password': controller.formKeyCustomer.currentState!.value['password'],
        };

        //Print the all fields
        debugPrint('Name: ${formData['name']}');
        debugPrint('Email: ${formData['email']}');
        debugPrint('Password: ${formData['password']}');

        final response = await createCustomerRepository.createCustomer(formData);

        if (response.statusCode == 201) {
          _showSuccessMessage(response.statusMessage.toString());
          _resetForm();
        } else {
          _showErrorMessage(response.statusMessage.toString());
        }
      }
    } catch (e) {
      _showCatchMessage(e.toString());
    }
  }
  void _resetForm() {
    controller.formKeyCustomer.currentState?.reset();
  }
  void _showSuccessMessage(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
  void _showErrorMessage(String message) {
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
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

