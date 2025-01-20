import 'package:get_test/base/Api_end_point/api_endpoints.dart';
import 'package:get_test/base/Dio_services/dio_base_repository.dart';
import 'package:get_test/Models/product_model.dart';

class GetProductRepository extends BaseRepository {
  Future<ProductResponseModel> getProducts() async {
    final response = await getDataFromServer(
      ApiEndpoint.getProduct,
      needsAuthorization: false,
      params: {},
    );
    return ProductResponseModel.fromJson(response.data);
  }
}

GetProductRepository getProductRepository = GetProductRepository();
