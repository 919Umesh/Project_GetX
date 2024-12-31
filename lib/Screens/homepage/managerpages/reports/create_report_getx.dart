import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateReportGetx extends GetxController {
  final formKeyUserForm = GlobalKey<FormBuilderState>();

  String giveReportTitle({DateTime? datetime}) {
    datetime ??= DateTime.now();
    // Create DateFormat instances
    DateFormat dayFormat = DateFormat('EEEE'); // Full weekday name
    DateFormat dateFormat = DateFormat('MMMM d, y'); // Full date

    // Get formatted day and date
    String dayName = dayFormat.format(datetime);
    String formattedDate = dateFormat.format(datetime);

    // Update the field value from the controller
    formKeyUserForm.currentState?.patchValue({
      'name': 'Report for $formattedDate, $dayName',
    });

    return 'Report for $formattedDate, $dayName';
  }
}
