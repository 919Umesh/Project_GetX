import 'package:dio/dio.dart';
import 'package:get_test/base/Api_end_point/api_endpoints.dart';
import 'package:get_test/base/Dio_services/dio_base_repository.dart';

class CreateCustomerRepository extends BaseRepository {
  Future<Response> createCustomer(FormData formData) async {
    var result= postDataToServer(
      ApiEndpoint.createCustomer,
      formData,
      needsAuthorization: false,
    );
    return result;
  }
}

final CreateCustomerRepository createCustomerRepository = CreateCustomerRepository();