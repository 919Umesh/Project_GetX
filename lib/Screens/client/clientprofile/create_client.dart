import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_test/Screens/client/clientprofile/create_user_repo.dart';
import 'package:get_test/Screens/reusable/appbar_login.dart';
import 'package:get_test/Screens/reusable/icon_button_b.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';


import 'create_client_getx.dart';

class CreateClientPage extends GetView<CreateClientGetx> {
  const CreateClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarLogin(
        title: "Edit profile",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.adaptSize,
            ),
            // const SizedBox(
            //   height: 10,
            // ),
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
                        'Client Name',
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
                        'Contat Number',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'contactNumber',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please enter a valid  contact number.';
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Client Email',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'email',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value != null && GetUtils.isEmail(value)) {
                            return 'Please enter a valid  email.';
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
                        height: 10.adaptSize,
                      ),
                      Text(
                        'Address',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'address',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Please enter a valid  address';
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
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.adaptSize,
            ),
            CustomIconButtonB(
              onPressed: () async {
                _saveForm();
              },
              text: 'Save profile',
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

    if (controller.formKeyUserForm.currentState!.saveAndValidate()) {
      d.Response response = await createClientRepository.postCreateUser(
          formData: d.FormData.fromMap(
              controller.formKeyUserForm.currentState!.value));

      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.back();
      } else {
        //SnackBar
      }
    }
  }
}
