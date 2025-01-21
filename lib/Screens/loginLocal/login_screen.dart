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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.backgroundColor.withOpacity(0.9),
              AppColors.backgroundColor,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  _buildHeader(),
                  const SizedBox(height: 40),
                  _buildCustomerForm(context),
                  SizedBox(height: 30.adaptSize),
                  _buildSaveButton(),
                  const SizedBox(height: 20),
                  _buildForgotPassword(),
                  const SizedBox(height: 40),
                  _buildSocialLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Sign in to continue',
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue,
          ),
        ),
      ],
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
            label: 'Email',
            name: 'email',
            hintText: 'Enter your email',
            prefixIcon: Icons.email_outlined,
            validator: (value) =>
            value == null || value.isEmpty ? 'Please enter a valid email.' : null,
          ),
          SizedBox(height: 20.adaptSize),
          _buildTextField(
            context,
            label: 'Password',
            name: 'password',
            hintText: 'Enter your password',
            prefixIcon: Icons.lock_outline,
            isPassword: true,
            validator: (value) =>
            value == null || value.isEmpty ? 'Please enter your password.' : null,
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
        IconData? prefixIcon,
        bool isPassword = false,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 8),
        FormBuilderTextField(
          name: name,
          obscureText: isPassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          style: TextStyle(color: Colors.blue),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.blue),
            prefixIcon: Icon(prefixIcon, color: Colors.blue),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.blue),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.blue),
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(0.1),
          ),
          keyboardType: isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return Container(
      width: double.maxFinite,
      height: 55.adaptSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [Colors.blue.shade400, Colors.blue.shade600],
        ),
      ),
      child: CustomIconButtonB(
        onPressed: _saveForm,
        text: 'Sign In',
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Center(
      child: TextButton(
        onPressed: () {
          // Add forgot password functionality
        },
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLogin() {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: Divider(color: Colors.blue)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Continue with',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Expanded(child: Divider(color: Colors.blue)),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialButton(Icons.g_mobiledata, 'Google'),
            const SizedBox(width: 20),
            _socialButton(Icons.facebook, 'Facebook'),
          ],
        ),
      ],
    );
  }

  Widget _socialButton(IconData icon, String platform) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 8),
          Text(
            platform,
            style: TextStyle(color: Colors.blue),
          ),
        ],
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
          await SharedPreferencesHelper.saveStringLocal('Token', response.data['token']);
          await SharedPreferencesHelper.saveStringLocal('userID', response.data['user']['id']);
          String userID = await SharedPreferencesHelper.getStringLocal('userID');
          debugPrint("Stored userID: $userID");
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
      colorText: Colors.blue,
      duration: const Duration(seconds: 3),
    );
  }

  void _showErrorMessage(String message) {
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  void _showCatchMessage(String e) {
    Get.snackbar(
      'Error',
      e,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
}