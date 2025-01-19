// lib/features/product/presentation/create_product_page.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'create_product_getX.dart';

class CreateProductPage extends GetView<CreateProductController> {
  const CreateProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Product'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildProductForm(context),
              const SizedBox(height: 20),
              _buildSaveButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  FormBuilder _buildProductForm(BuildContext context) {
    return FormBuilder(
      key: controller.formKeyProduct,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField(
            label: 'Product Name',
            name: 'name',
            validator: (value) => value == null || value.isEmpty
                ? 'Please enter a valid name.'
                : null,
          ),
          const SizedBox(height: 20),
          _buildTextField(
            label: 'Sales Rate',
            name: 'salesRate',
            validator: (value) =>
            value == null || double.tryParse(value) == null
                ? 'Enter a valid rate.'
                : null,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          _buildTextField(
            label: 'Purchase Rate',
            name: 'purchaseRate',
            validator: (value) =>
            value == null || double.tryParse(value) == null
                ? 'Enter a valid rate.'
                : null,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          _buildTextField(
            label: 'Quantity',
            name: 'quantity',
            validator: (value) => value == null || int.tryParse(value) == null
                ? 'Enter a valid quantity.'
                : null,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          _buildTextField(
            label: 'Unit',
            name: 'unit',
            validator: (value) =>
            value == null || value.isEmpty ? 'Enter a valid unit.' : null,
          ),
          const SizedBox(height: 20),
          _buildTextField(
            label: 'Duration',
            name: 'duration',
            validator: (value) => value == null || value.isEmpty
                ? 'Enter a valid duration.'
                : null,
          ),
          const SizedBox(height: 20),
          FormBuilderDateTimePicker(
            name: 'fromDate',
            initialValue: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            inputType: InputType.date,
            validator: (value) =>
            value == null ? 'Select a valid start date.' : null,
            decoration: InputDecoration(
              labelText: 'From Date',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          FormBuilderDateTimePicker(
            name: 'toDate',
            initialValue: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            inputType: InputType.date,
            validator: (value) =>
            value == null ? 'Select a valid end date.' : null,
            decoration: InputDecoration(
              labelText: 'To Date',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildTextField({
    required String label,
    required String name,
    required String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 10),
        FormBuilderTextField(
          name: name,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () => controller.saveProduct(),
        child: const Text('Save Product'),
      ),
    );
  }
}