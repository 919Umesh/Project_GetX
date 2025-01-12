import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF349CF3); // Light Blue
  static const Color secondary = Color(0xFFFF6A00); // Orange
  static const Color darkBklue = Color(0xFF0E1621); // Dark Blue
  static const Color darkGrey = Color(0xFF475467); // Dark Grey
  static const Color mediumGrey = Color(0xFF525967); // Medium Grey
  static const Color lightGrey = Color.fromARGB(255, 199, 192, 192); // Light Grey
  static const Color calenderBlue = Color(0xFF3C7DFF); // calender Blue
  static const Color calenderUnselected = Color(0xFFEBF2FF); // calender Blue
  static const Color darkBlue = Color(0xFF073DA1); // Dark Blue
  static const Color white = Colors.white; // Dark Blue
  static const Color black = Colors.black; // Dark Blue
  static const Color backgroundColor = Color(0xFFF4F7FE); // Dark Blue
  static const Color red = Colors.red; // Dark Blue
}

class SharedPreferenceKey {
  static const String token = 'token';
  static const String username = 'username';
  static const String userid = 'userid';
  static const String hasLocationPermission = 'has_location_permission';
  static const String fcmToken = 'fcm_token';
  static const String mySiteDetail = 'my_site_detail';
  static const String appLanguage = 'app_language';
}
