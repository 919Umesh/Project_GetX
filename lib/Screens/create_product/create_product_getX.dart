import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

class CreateProductController extends GetxController {
  final formKeyProduct = GlobalKey<FormBuilderState>();

  File? fileimageFile;
  d.MultipartFile? multiPartPhoto;
}
