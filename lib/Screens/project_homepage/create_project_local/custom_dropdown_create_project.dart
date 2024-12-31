import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/Screens/client/clientprofile/create_client.dart';
import 'package:get_test/Screens/project_homepage/create_project_local/project_status_model.dart';
import 'package:get_test/Screens/reusable/custom_draggable_empty.dart';
import 'package:get_test/Screens/reusable/icon_button_b.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';

class CustomDropdownFormProjectLocal extends StatelessWidget {
  final String name;
  final List<ProjectStatusModel> items;
  final FormFieldValidator<String>? validator;
  final String? initialValue;

  const CustomDropdownFormProjectLocal({
    super.key,
    required this.name,
    required this.items,
    this.validator,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: name,
      validator: validator,
      initialValue: initialValue,
      builder: (FormFieldState<String?> field) {
        return InputDecorator(
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.arrow_drop_down),
              onPressed: () {
                _showDraggableSnackbar(context, field);
              },
            ),
            errorText: field.errorText,
          ),
          child: InkWell(
            onTap: () => _showDraggableSnackbar(context, field),
            child: Text(
              field.value != null
                  ? (items.firstWhere((e) {
                if (e.status == field.value) {
                  return true;
                } else {
                  return false;
                }
              }).status)
                  : 'Select an option',
              style: TextStyle(
                color: field.value == null ? Colors.grey : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }

  void _showDraggableSnackbar(
      BuildContext context, FormFieldState<String?> field) {
    double height = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return CustomDraggableEmpty(
          initialheight: 0.80,
          maxheight: 0.90,
          childWidget: Column(
            children: [
              SizedBox(
                height: height * 0.60, // Adjust the height as needed
                child: ListView(
                  children: items.map((item) {
                    return ListTile(
                      title: Text(item.status),
                      subtitle: Text(item.status),
                      trailing: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return const CustomDraggableEmpty(
                                    initialheight: 0.65,
                                    childWidget: CreateClientPage());
                              },
                            );
                          },
                          icon: const Icon(Icons.edit)),
                      onTap: () {
                        field.didChange(item.status);
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                ),
              ),
              Divider(
                height: 15.adaptSize,
                thickness: 2,
                color: AppColors.lightGrey,
                endIndent: 15.adaptSize,
                indent: 15.adaptSize,
              ),
              const Text(
                'Client not found? You can always create new one.',
                textAlign: TextAlign.center,
              ),
              CustomIconButtonF(
                text: 'Add new client +',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return const CustomDraggableEmpty(
                          initialheight: 0.65, childWidget: CreateClientPage());
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
