import 'package:dio/dio.dart';
import 'package:get_test/base/Api_end_point/api_endpoints.dart';
import 'package:get_test/base/Dio_services/dio_base_repository.dart';

class LoginLocalRepository extends BaseRepository {
  Future<Response> userLogin(Map<String, dynamic> jsonData) async {
    return await postDataToServerTest(
      ApiEndpoint.loginLocal,
      jsonData: jsonData,
      needsAuthorization: false,
      iSJsonDataHeaderType: true,
    );
  }
}

final LoginLocalRepository loginLocalRepository = LoginLocalRepository();