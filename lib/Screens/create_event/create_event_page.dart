import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart' hide FormData, Response;
import 'package:get_test/Screens/create_event/create_event_getX.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import '../../Helper/constants.dart';
import '../reusable/icon_button_b.dart';
import 'create_event_repo.dart';

class CreateEventPage extends GetView<CreateEventController> {
  const CreateEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event'),
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
      key: controller.formKeyEvent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField(
            context,
            label: 'title',
            name: 'title',
            validator: (value) =>
            value == null || value.isEmpty ? 'Please enter a valid name.' : null, hintText: 'Enter title',
          ),
          SizedBox(height: 20.adaptSize),
          _buildTextField(
            context,
            label: 'description',
            name: 'description',
            validator: (value) =>
            value == null || value.isEmpty ? 'Please enter a valid email.' : null, hintText: 'Enter description',
          ),
          const SizedBox(height: 10),
          Text(
            'Time',
            style: context.textTheme.titleSmall,
          ),
          FormBuilderDateTimePicker(
            name: 'date',
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cancelText: "Cancel",
            initialValue: DateTime.now().toLocal(),
            validator: (value) {
              if (value == null) {
                return 'Please enter a valid Date Range.';
              }
              return null;
            },
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime(2040),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 8.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                suffixIcon: const Icon(Icons.calendar_month)),
            keyboardType: TextInputType.text,
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
        text: 'Save Project',
      ),
    );
  }

  Future<void> _saveForm() async {
    try {
      if (controller.formKeyEvent.currentState!.saveAndValidate()) {

        DateTime selectedDate = controller.formKeyEvent.currentState!.value['date'];


        String formattedDate = "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
        final formData = {
          'title': controller.formKeyEvent.currentState!.value['title'],
          'description': controller.formKeyEvent.currentState!.value['description'],
          'date':formattedDate,
        };

        debugPrint('Name: ${formData['title']}');
        debugPrint('Email: ${formData['description']}');
        debugPrint('Password: $formattedDate');
        final response = await createEventRepository.createEvent(formData);

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
    controller.formKeyEvent.currentState?.reset();
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

