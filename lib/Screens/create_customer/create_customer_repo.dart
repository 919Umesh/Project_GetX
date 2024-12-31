import 'package:dio/dio.dart';
import 'package:get_test/base/Api_end_point/api_endpoints.dart';
import 'package:get_test/base/Dio_services/dio_base_repository.dart';

class CreateCustomerRepository extends BaseRepository {
  Future<Response> createCustomer(Map<String, dynamic> jsonData) async {
    return await postDataToServerTest(
      ApiEndpoint.createCustomer,
      jsonData: jsonData,
      needsAuthorization: false,
      iSJsonDataHeaderType: true,
    );
  }
}

final CreateCustomerRepository createCustomerRepository = CreateCustomerRepository();