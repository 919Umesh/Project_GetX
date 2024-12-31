import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_test/Screens/reusable/icon_button_b.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import '../../../../Helper/constants.dart';
import 'create_project_local_getX.dart';
import 'create_project_local_repo.dart';
import 'custom_dropdown_create_project.dart';

class CreateProjectLocalPage extends GetView<CreateProjectLocalGetX> {
  const CreateProjectLocalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Project'),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              FormBuilder(
                key: controller.formKeyLocalProjectForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Project Name *',
                          style: context.textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FormBuilderTextField(
                          name: 'name',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value == "") {
                              return 'Please enter a valid  name.';
                            }
                            return null;
                          },
                          // initialValue: controller.userProfileModel?.fullname,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        Text(
                          'duration',
                          style: context.textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FormBuilderTextField(
                          name: 'duration',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value == "") {
                              return 'Please enter a valid  name.';
                            }
                            return null;
                          },
                          // initialValue: controller.userProfileModel?.fullname,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        Text(
                          'members',
                          style: context.textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FormBuilderTextField(
                          name: 'members',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value == "") {
                              return 'Please enter a valid  name.';
                            }
                            return null;
                          },
                          // initialValue: controller.userProfileModel?.fullname,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        Text(
                          'location',
                          style: context.textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FormBuilderTextField(
                          name: 'location',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value == "") {
                              return 'Please enter a valid  name.';
                            }
                            return null;
                          },
                          // initialValue: controller.userProfileModel?.fullname,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        Text(
                          'amount',
                          style: context.textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FormBuilderTextField(
                          name: 'amount',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value == "") {
                              return 'Please enter a valid  name.';
                            }
                            return null;
                          },
                          // initialValue: controller.userProfileModel?.fullname,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        Text(
                          'status',
                          style: context.textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GetBuilder(
                            init: CreateProjectLocalGetX(),
                            builder: (cotroller) {
                              return CustomDropdownFormProjectLocal(
                                name: 'status',
                                items: cotroller.projectStatusModels,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select an option.';
                                  }
                                  return null;
                                },
                              );
                            }),
                        const SizedBox(
                          height: 10,
                        ),
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
                        Text(
                          'Date Range',
                          style: context.textTheme.titleSmall,
                        ),
                        FormBuilderDateRangePicker(
                          name: 'daterange',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null) {
                              return 'Please enter a valid Date Range.';
                            }
                            return null;
                          },
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
                        FormBuilderField(
                          name: 'startDate',
                          builder: (field) {
                            return const SizedBox();
                          },
                        ),
                        FormBuilderField(
                          name: 'endDate',
                          builder: (field) {
                            return const SizedBox();
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FormBuilderCheckboxGroup<String>(
                          name: 'select_choice', // Use a valid name identifier (snake_case recommended)
                          decoration: const InputDecoration(
                            labelText: 'Select Choice', // Optional label for the field
                          ),
                          options: const [
                            FormBuilderFieldOption(value: 'Choice 1', child: Text('Choice 1')),
                            FormBuilderFieldOption(value: 'Choice 2', child: Text('Choice 2')),
                            FormBuilderFieldOption(value: 'Choice 3', child: Text('Choice 3')),
                          ],
                          onChanged: (value) {
                            print('Selected choices: $value'); // Handle value changes
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        FormBuilderChoiceChip<String>(
                          name: 'choice_chip', // Use a unique identifier for this field
                          decoration: const InputDecoration(
                            labelText: 'Select an option', // Optional label
                          ),
                          options: const [
                            FormBuilderChipOption(value: 'Option 1', child: Text('Option 1')),
                            FormBuilderChipOption(value: 'Option 2', child: Text('Option 2')),
                            FormBuilderChipOption(value: 'Option 3', child: Text('Option 3')),
                          ],
                          onChanged: (value) {
                            print('Selected choice: $value'); // Handle selected value
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        FormBuilderSlider(
                          name: 'slider',
                          initialValue: 50.0,
                          min: 0.0,
                          max: 100.0,
                          divisions: 20,
                          decoration: const InputDecoration(
                            labelText: 'Set a value',
                          ),
                          onChanged: (value) {
                            print('Slider value changed to: $value'); // Handle value changes
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FormBuilderSwitch(
                          name: 'switch', // Unique identifier for this field
                          title: const Text('Enable Notifications'), // Title to display next to the switch
                          initialValue: false, // Optional: Initial value of the switch
                          decoration: const InputDecoration(
                            labelText: 'Toggle Setting', // Optional label
                          ),
                          onChanged: (value) {
                            print('Switch state changed to: $value'); // Handle state changes
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FormBuilderDropdown<String>(
                          name: 'dropdown', // Unique identifier for this field
                          decoration: const InputDecoration(
                            labelText: 'Select an option', // Label for the dropdown
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'Option 1',
                              child: Text('Option 1'),
                            ),
                            DropdownMenuItem(
                              value: 'Option 2',
                              child: Text('Option 2'),
                            ),
                            DropdownMenuItem(
                              value: 'Option 3',
                              child: Text('Option 3'),
                            ),
                          ], // List of dropdown items
                          onChanged: (value) {
                            print('Selected value: $value'); // Handle value changes
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FormBuilderRadioGroup<String>(
                          name: 'radio_group', // Unique identifier for this field
                          decoration: const InputDecoration(
                            labelText: 'Select an option', // Label for the radio group
                          ),
                          options: const [
                            FormBuilderFieldOption(value: 'Option 1', child: Text('Option 1')),
                            FormBuilderFieldOption(value: 'Option 2', child: Text('Option 2')),
                            FormBuilderFieldOption(value: 'Option 3', child: Text('Option 3')),
                          ], // List of radio button options
                          onChanged: (value) {
                            print('Selected value: $value'); // Handle value changes
                          },
                        )

                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.adaptSize,
              ),
              SizedBox(
                width: double.maxFinite,
                height: 55.adaptSize,
                child: CustomIconButtonB(
                  onPressed: () async {
                    await _saveForm();
                  },
                  text: 'Save Project',
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveForm() async {
    try {
      if (controller.formKeyLocalProjectForm.currentState!.saveAndValidate()) {
        final formData = {
          'name':
              controller.formKeyLocalProjectForm.currentState!.value['name'],
          'duration': controller
              .formKeyLocalProjectForm.currentState!.value['duration'],
          'members':
              controller.formKeyLocalProjectForm.currentState!.value['members'],
          'location': controller
              .formKeyLocalProjectForm.currentState!.value['location'],
          'amount':
              controller.formKeyLocalProjectForm.currentState!.value['amount'],
          'status':
              controller.formKeyLocalProjectForm.currentState!.value['status'],
        };
        final response =
            await createProjectLocalRepository.postProjectLocal(formData);
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
    controller.formKeyLocalProjectForm.currentState?.reset();
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
