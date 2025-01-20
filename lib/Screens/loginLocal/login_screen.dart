import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart' hide FormData, Response;
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import '../../Helper/constants.dart';
import '../../Helper/get_routes.dart';
import '../../Helper/shared_preference_fun.dart';
import '../reusable/icon_button_b.dart';
import 'login_getX.dart';
import 'login_repository.dart';

class LoginLocalPage extends GetView<LoginLocalController> {
  const LoginLocalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
      key: controller.formKeyLogin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField(
            context,
            label: 'email',
            name: 'email',
            validator: (value) =>
            value == null || value.isEmpty ? 'Please enter a valid name.' : null, hintText: 'Enter title',
          ),
          SizedBox(height: 20.adaptSize),
          _buildTextField(
            context,
            label: 'password',
            name: 'password',
            validator: (value) =>
            value == null || value.isEmpty ? 'Please enter a valid email.' : null, hintText: 'Enter description',
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      BuildContext context, {
        required String label,
        required String name,
        required String hintText,
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
            hintText: hintText,
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
        text: 'Login',
      ),
    );
  }

  Future<void> _saveForm() async {
    try {
      if (controller.formKeyLogin.currentState!.saveAndValidate()) {

        final formData = {
          'email': controller.formKeyLogin.currentState!.value['email'],
          'password': controller.formKeyLogin.currentState!.value['password'],
        };
        debugPrint('email: ${formData['email']}');
        debugPrint('password: ${formData['password']}');
        final response = await loginLocalRepository.userLogin(formData);

        if (response.statusCode == 200) {
          _showSuccessMessage(response.statusMessage.toString());
          await SharedPreferencesHelper.saveStringLocal('userID', response.data['user']['id']);
          String userID = await SharedPreferencesHelper.getStringLocal('userID');
          print("Stored userID: $userID");
          _resetForm();
          Get.toNamed(Routes.getCustomer);
        } else {
          _showErrorMessage(response.statusMessage.toString());
        }
      }
    } catch (e) {
      _showCatchMessage(e.toString());
    }
  }
  void _resetForm() {
    controller.formKeyLogin.currentState?.reset();
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

