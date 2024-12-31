import 'dart:developer';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_test/Screens/homepage/managerpages/createproject/create_project_repo.dart';
import 'package:get_test/Screens/reusable/appbar_login.dart';
import 'package:get_test/Screens/reusable/icon_button_b.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import 'create_report_getx.dart';

class CreateReportPage extends GetView<CreateReportGetx> {
  const CreateReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarHome(
        title: 'Create Report',
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

                      const Text(
                        "Design Estimate & Construction",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff475467),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Report title *',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'name',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        initialValue: controller.giveReportTitle(),
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please enter a valid  name.';
                          }
                          return null;
                        },
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
                        minLines: 2,
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
                        'Report Date ',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 10,
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

                      const SizedBox(
                        height: 10,
                      ),

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
                text: 'Create  Report',
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
        d.Response response = await createProjectRepository.postCreateUser(
            formData: d.FormData.fromMap(controller.formKeyUserForm.currentState!.value));
        if (response.statusCode == 201 || response.statusCode == 200) {
          Get.back();
        } else {
          //SnackBar
        }
      }
    } catch (e) {
      log("Some thing went wring Error : $e");
    }
  }
}
