import 'dart:io';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_test/Models/client_model.dart';
import '../../../Models/profile_model.dart';
import '../../../Models/sign_uo_responsemodel.dart';

class CreateClientGetx extends GetxController {
  final formKeyUserForm = GlobalKey<FormBuilderState>();

  ///Client Side Create Profile
  final formKeyUserFormClient = GlobalKey<FormBuilderState>();
  File? fileimageFile;
  d.MultipartFile? multiPartPhoto;
  int genderindex = 0;
  Rx<bool> isProfileLoading = false.obs;

  SignupResponseModel? signupResponseModel;
  UserProfileModel? userProfileModel;
  //////

  List<ClientModel> clientMoClientModels = [
    ClientModel(
      id: 1.toString(),
      name: 'Alice Johnson',
      contact: '123-456-7890',
      mail: 'alice.johnson@example.com',
      location: 'New York, NY',
    ),
    ClientModel(
      id: 4.toString(),
      name: 'Bob Smith',
      contact: '234-567-8901',
      mail: 'bob.smith@example.com',
      location: 'Los Angeles, CA',
    ),
    ClientModel(
      id: 5.toString(),
      name: 'Charlie Brown',
      contact: '345-678-9012',
      mail: 'charlie.brown@example.com',
      location: 'Chicago, IL',
    ),
    ClientModel(
      id: 3.toString(),
      name: 'Diana Prince',
      contact: '456-789-0123',
      mail: 'diana.prince@example.com',
      location: 'Houston, TX',
    ),
    ClientModel(
      id: 2.toString(),
      name: 'Eve Adams',
      contact: '567-890-1234',
      mail: 'eve.adams@example.com',
      location: 'Phoenix, AZ',
    ),
    ClientModel(
      id: 6.toString(),
      name: 'Frank Castle',
      contact: '678-901-2345',
      mail: 'frank.castle@example.com',
      location: 'Philadelphia, PA',
    ),
    ClientModel(
      id: 7.toString(),
      name: 'Grace Lee',
      contact: '789-012-3456',
      mail: 'grace.lee@example.com',
      location: 'San Antonio, TX',
    ),
    ClientModel(
      id: 8.toString(),
      name: 'Hank Pym',
      contact: '890-123-4567',
      mail: 'hank.pym@example.com',
      location: 'San Diego, CA',
    ),
    ClientModel(
      id: 9.toString(),
      name: 'Ivy Walker',
      contact: '901-234-5678',
      mail: 'ivy.walker@example.com',
      location: 'Dallas, TX',
    ),
    ClientModel(
      id: 10.toString(),
      name: 'Jack Reacher',
      contact: '012-345-6789',
      mail: 'jack.reacher@example.com',
      location: 'San Jose, CA',
    ),
  ];
}
