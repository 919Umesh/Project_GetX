import 'dart:io';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../Helper/get_routes.dart';
import '../reusable/loading_button.dart';
import 'create_product_getX.dart';
import 'create_product_repo.dart';

class CreateProductPage extends GetView<CreateProductController> {
  const CreateProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            FormBuilder(
              key: controller.formKeyProduct,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormBuilderField(
                        name: 'productImage',
                        builder: (FormFieldState<dynamic> field) {
                          return const SizedBox();
                        },
                      ),
                      Text(
                        'Product Name **',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'name',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        initialValue: 'Product Alpha',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid product name.';
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
                      SizedBox(height: 20.adaptSize),

                      Text(
                        'Sales Rate **',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'salesRate',
                        initialValue: '500',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter sales rate.';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number.';
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
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20.adaptSize),

                      Text(
                        'Purchase Rate **',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'purchaseRate',
                        initialValue: '400',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter purchase rate.';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number.';
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
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20.adaptSize),

                      Text(
                        'Quantity **',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'quantity',
                        initialValue: '100',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter quantity.';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number.';
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
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20.adaptSize),

                      Text(
                        'Unit **',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'unit',
                        initialValue: 'kg',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter unit.';
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
                      SizedBox(height: 20.adaptSize),

                      Text(
                        'Duration **',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'duration',
                        initialValue: 'monthly',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter duration.';
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
                      SizedBox(height: 20.adaptSize),

                      Text(
                        'From Date **',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      FormBuilderDateTimePicker(
                        name: 'fromDate',
                        initialValue: DateTime(2025, 1, 1),
                        inputType: InputType.date,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a from date.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.adaptSize),

                      Text(
                        'To Date **',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      FormBuilderDateTimePicker(
                        name: 'toDate',
                        initialValue: DateTime(2025, 1, 31),
                        inputType: InputType.date,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a to date.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.adaptSize),

                      Text(
                        'Product Image',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      LoadingButton(
                        onPressed: () => _showImagePickerDialog(context),
                        child: Text(
                          'Upload Image',
                          style: context.textTheme.titleSmall?.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            LoadingButton(
              onPressed: () async {
                await _saveForm();
              },
              child: Text(
                'Create Product',
                style: context.textTheme.titleSmall?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showImagePickerDialog(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => _buildImagePickerBottomSheet(context),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50.0),
            )
        )
    );
  }

  Widget _buildImagePickerBottomSheet(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 20.0),
                Center(
                  child: Container(
                    height: 7.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
                Container(height: 30),
                ListTile(
                  title: Text(
                    'From Gallery 🖼️ ',
                    style: context.textTheme.bodyMedium!.copyWith(color: Colors.black),
                  ),
                  onTap: () async {
                    await _openGallery(context);
                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    'From Camera 📷 ',
                    style: context.textTheme.bodyMedium!.copyWith(color: Colors.black),
                  ),
                  onTap: () async {
                    await _openCamera(context);
                    Get.back();
                  },
                ),
                Container(height: 20)
              ]
          ),
        )
    );
  }

  Future<void> _openCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    try {
      final cameraImageFile = await picker.pickImage(
          source: ImageSource.camera,
          imageQuality: 70
      );

      if (cameraImageFile != null) {
        final xfile = await d.MultipartFile.fromFile(cameraImageFile.path);
        controller.fileimageFile = File(cameraImageFile.path);
        controller.multiPartPhoto = xfile;
        controller.update();
      }
    } catch (e) {
      debugPrint('User canceled image capturing');
    }
  }

  Future<void> _openGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    try {
      final galleryImageFile = await picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 70
      );

      if (galleryImageFile != null) {
        final xfile = await d.MultipartFile.fromFile(galleryImageFile.path);

        controller.fileimageFile = File(galleryImageFile.path);
        controller.multiPartPhoto = xfile;
        controller.update();
      }
    } catch (e) {
      debugPrint('User Canceled Image picking');
    }
  }

  Future<void> _saveForm() async {
    if (controller.multiPartPhoto != null) {
      Fluttertoast.showToast(msg: 'Image');
      controller.formKeyProduct.currentState!.fields['productImage']!.didChange(controller.multiPartPhoto);
    }

    if (controller.formKeyProduct.currentState!.saveAndValidate()) {
      debugPrint('------------------Before-----------------');

      final fields = controller.formKeyProduct.currentState!.fields;
      final fieldValues = fields.map((key, value) => MapEntry(key, value.value));


      final dateFormat = DateFormat('yyyy-MM-dd');
      if (fields['fromDate']?.value != null) {
        fieldValues['fromDate'] = dateFormat.format(fields['fromDate']!.value as DateTime);
      }
      if (fields['toDate']?.value != null) {
        fieldValues['toDate'] = dateFormat.format(fields['toDate']!.value as DateTime);
      }

      debugPrint('Form Fields After Date Formatting: $fieldValues');
      debugPrint('Selected Image File: ${controller.fileimageFile}');
      try {
        d.Response response = await createProductRepository.createProduct(d.FormData.fromMap(controller.formKeyProduct.currentState!.value,),);
        if (response.statusCode == 201 || response.statusCode == 200) {
          Get.offAndToNamed(Routes.loginLocal);
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
  }
}