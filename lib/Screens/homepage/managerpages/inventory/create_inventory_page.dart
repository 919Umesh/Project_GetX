import 'dart:developer';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/Screens/homepage/managerpages/createproject/create_project_repo.dart';
import 'package:get_test/Screens/reusable/appbar_login.dart';
import 'package:get_test/Screens/reusable/icon_button_b.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';


import 'create_inventory_getx.dart';

class CreateInventorytPage extends GetView<CreateInventorytGetx> {
  const CreateInventorytPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarHome(
        title: 'Add items',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
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
                      SizedBox(
                        height: 10.adaptSize,
                      ),
                      Text(
                        'Item name *',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 8,
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
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          hintText: 'Ex: Cement , Brick , Equipment',
                        ),
                        keyboardType: TextInputType.text,
                      ),

                      SizedBox(
                        height: 20.adaptSize,
                      ),
                      Text(
                        'Quantity *',
                        style: context.textTheme.titleSmall,
                      ),
                      SizedBox(
                        height: 10.adaptSize,
                      ),
                      FormBuilderTextField(
                        name: 'quantity',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please enter valid amount.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          hintText: 'Ex: 10 , 20 ',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 20.adaptSize,
                      ),
                      Text(
                        'Unit *',
                        style: context.textTheme.titleSmall,
                      ),
                      SizedBox(
                        height: 10.adaptSize,
                      ),
                      FormBuilderTextField(
                        name: 'unit',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Enter a valid  unit ex:- Kg , liter, meter';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          hintText: 'Ex: Kg , litre, meter ',
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 20.adaptSize,
                      ),
                      Text(
                        'Date ',
                        style: context.textTheme.titleSmall,
                      ),
                      SizedBox(
                        height: 10.adaptSize,
                      ),
                      FormBuilderDateTimePicker(
                        name: 'date',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        initialValue: DateTime.now().toLocal(),
                        cancelText: "Cancel",
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

                      SizedBox(
                        height: 20.adaptSize,
                      ),
                      Text(
                        'Item In or Out from Site ',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderRadioGroup(
                        name: 'inout',
                        options: const [
                          FormBuilderFieldOption(
                              value: 'In', child: Text('In')),
                          FormBuilderFieldOption(
                              value: 'Out', child: Text('Out')),
                        ],
                        activeColor: AppColors.secondary,
                      ),
                      SizedBox(
                        height: 20.adaptSize,
                      ),
                      Text(
                        'Type of item',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderRadioGroup(
                        name: 'Stockorinventory',
                        options: const [
                          FormBuilderFieldOption(
                              value: 'inventory',
                              child: Text('Inventory Item')),
                          FormBuilderFieldOption(
                              value: 'stock', child: Text('Stock Item')),
                        ],
                        activeColor: AppColors.secondary,
                      ),

                      SizedBox(
                        height: 20.adaptSize,
                      ),
                      Text(
                        'Remark ',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'description',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLines: 3,
                        minLines: 2,
                        decoration: InputDecoration(
                          hintText: 'Leave a note to remember ',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 10.adaptSize,
                      ),
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
                text: 'Add to List',
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
            formData: d.FormData.fromMap(
                controller.formKeyUserForm.currentState!.value));

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
