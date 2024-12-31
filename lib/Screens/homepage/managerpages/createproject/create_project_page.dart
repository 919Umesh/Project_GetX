import 'dart:developer';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_test/Screens/client/clientprofile/create_client_getx.dart';
import 'package:get_test/Screens/homepage/managerpages/createproject/create_project_repo.dart';
import 'package:get_test/Screens/reusable/icon_button_b.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import 'package:intl/intl.dart';
import '../../../../Helper/constants.dart';
import '../../../reusable/custom_dropdown_formfield.dart';
import 'create_project_getx.dart';

class CreateProjectPage extends GetView<CreateProjectGetx> {
  const CreateProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            // Center(
            //   child: Stack(children: [
            //     picture(),
            //     Positioned(
            //       right: 1,
            //       bottom: 1,
            //       child: GestureDetector(
            //         onTap: () {
            //           FocusManager.instance.primaryFocus?.unfocus();
            //           _showDialog(context, false);
            //         },
            //         child: Container(
            //           height: 32.0,
            //           width: 32.0,
            //           decoration: BoxDecoration(
            //             border:
            //                 Border.all(width: 1, color: PrimaryColors.white900),
            //             shape: BoxShape.circle,
            //             color: context.theme.primaryColor,
            //           ),
            //           child: Center(
            //             child: Icon(Icons.edit, color: PrimaryColors.white900),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ]),
            // ),
            FormBuilder(
              key: controller.formKeyUserForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // FormBuilderField(
                      //   name: 'restourntImage',
                      //   initialValue:
                      //       controller.restProfileModel?.restourentPictures ??
                      //           '',
                      //   builder: (FormFieldState<dynamic> field) {
                      //     return const SizedBox();
                      //   },
                      // ),
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
                      SizedBox(
                        height: 20.adaptSize,
                      ),
                      Text(
                        'Description *',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'description',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please enter a valid  description';
                          }
                          return null;
                        },
                        maxLines: 5,
                        minLines: 3,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Project Duration *',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 10,
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
                      Text(
                        'Client Name *',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder(
                          init: CreateClientGetx(),
                          builder: (cotroller) {
                            return CustomDropdownFormField(
                              name: 'clientid',
                              items: cotroller.clientMoClientModels,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select an option.';
                                }
                                return null;
                              },
                            );
                          }),
                      const SizedBox(height: 20),
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
                  _saveForm();
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
    );
  }

  _saveForm() async {
    // if (controller.multiPartPhoto != null) {
    //   controller.formKeyUserForm.currentState!.fields['restaurentImage']!
    //       .didChange(controller.multiPartPhoto);
    // }

    try {
      if (controller.formKeyUserForm.currentState!.saveAndValidate()) {
        DateTimeRange? dateRange =
            controller.formKeyUserForm.currentState!.value['daterange'];
        if (dateRange != null) {
          String startDate = DateFormat('yyyy-MM-dd').format(dateRange.start);
          String endDate = DateFormat('yyyy-MM-dd').format(dateRange.end);

          controller.formKeyUserForm.currentState!.fields['startDate']
              ?.didChange(startDate);
          controller.formKeyUserForm.currentState!.fields['endDate']
              ?.didChange(endDate);
        }
      }

      d.Response response = await createProjectRepository.postCreateUser(
          formData: d.FormData.fromMap(controller.formKeyUserForm.currentState!.value));

      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.back();
      } else {
        //SnackBar
      }
    } catch (e) {
      log("Some thing went wring Error : $e");
    }
  }
}
