import 'package:dio/dio.dart';
import 'package:get_test/base/Api_end_point/api_endpoints.dart';
import 'package:get_test/base/Dio_services/dio_base_repository.dart';

class CreateEventRepository extends BaseRepository {
  Future<Response> createEvent(Map<String, dynamic> jsonData) async {
    return await postDataToServerTest(
      ApiEndpoint.createEvent,
      jsonData: jsonData,
      needsAuthorization: false,
      iSJsonDataHeaderType: true,
    );
  }
}

final CreateEventRepository createEventRepository = CreateEventRepository();