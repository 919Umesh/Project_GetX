import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_test/Screens/project_homepage/create_project_local/project_status_model.dart';

class CreateProjectLocalGetX extends GetxController {
  final formKeyLocalProjectForm = GlobalKey<FormBuilderState>();

  List<ProjectStatusModel> projectStatusModels = [
    ProjectStatusModel(
      status: 'pending',
    ),
    ProjectStatusModel(
      status: 'in-progress',
    ),
    ProjectStatusModel(

      status: 'complete',
    ),
  ];
}
