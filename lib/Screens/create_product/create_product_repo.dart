
import 'package:dio/dio.dart';
import 'package:get_test/base/Api_end_point/api_endpoints.dart';
import 'package:get_test/base/Dio_services/dio_base_repository.dart';

class CreateProductRepository extends BaseRepository {
  Future<Response> createProduct({FormData? formData}) async {
    return await postDataToServer(
      ApiEndpoint.createProductLocal,
      formData!,
      needsAuthorization: false,
      iSJsonDataHeaderType: false,
    );
  }
}

final CreateProductRepository createProductRepository = CreateProductRepository();



