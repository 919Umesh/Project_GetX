import 'package:flutter/foundation.dart';

class ApiEndpoint {
  static const String baseUrl = kDebugMode ? 'http://192.168.1.64:3000' : 'http://192.168.1.64:3000';
  static const String imagebaseUrl = kDebugMode ? 'http://192.168.101.2:8080' : 'http://192.168.101.2:8080';

  static const String forgetPassword = '';
  static const String signup = '/user/sign-up/';
  static const String googlesign = '/credentials/access_token';
  static const String signin = '/user/sign-in/';
  static const String createUser = '/user/profile-setup/';
  static const String getUserProfile = '/user/get-user-profile/';
  static const String getProjectDetail = '/user/get-user-profile/';
  static const String getOrderReport = '/MasterList/PendingOrderVerifyList/';
  static const String createProduct = '/GeneralLedger/SaveProductRelated/';
  static const String createCustomer= '/users/create/';
  static const String createEvent= '/event/createEvent/';
  static const String getCustomer= '/users/getUsers';
  static const String getEvents= '/event/getEvents/';
  static const String getProjectList= '/project/get/';
  static const String createProjectLocal= '/project/create/';
  static const String projectSearchLocal= '/project/search/';
  static const String createProductLocal= '/product/create';
  static const String getProduct= '/product/get';
  static const String getChatHistory= '/chat/chat_history/';
  static const String loginLocal= '/users/loginUser';
}
