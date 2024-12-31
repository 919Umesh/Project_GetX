import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../base/Api_end_point/api_endpoints.dart';
import '../../../../base/Dio_services/dio_base_repository.dart';

class CreateProjectLocalRepository extends BaseRepository {
  Future<Response> postProjectLocal(Map<String, dynamic> jsonData) async {
    Response response = await postDataToServerTest(
      ApiEndpoint.createProjectLocal,
      jsonData:jsonData,
      needsAuthorization: false,
      iSJsonDataHeaderType: true,
    );
    debugPrint('Response Data: ${response.data}');
    return response;
  }

}

CreateProjectLocalRepository createProjectLocalRepository = CreateProjectLocalRepository();

