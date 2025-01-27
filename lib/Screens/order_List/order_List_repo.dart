import 'package:get_test/Models/order_report_model.dart';
import 'package:get_test/base/Dio_services/dio_base_repository.dart';
import 'package:get_test/base/Api_end_point/api_endpoints.dart';

class CreateClientRepository extends BaseRepository {
  // Fetch order report data from the server
  Future<OrderReportModel> getOrderReport(
      String dbName,
      String agentCode, {
        int page = 1,
        int pageSize = 10,
      }) async {
    final response = await getDataFromServer(
      ApiEndpoint.getOrderReport,
      needsAuthorization: false,
      params: {
        'DbName': dbName,
        'BrCode': '',
        'UnitCode': '',
        'Module': '',
        'UserCode': '',
        'Glcode': '',
        'Agentcode': agentCode,
        'Page': page,
        'PageSize': pageSize,
      },
    );
    return OrderReportModel.fromJson(response.data);
  }
}

// Singleton instance of the repository
CreateClientRepository createOrderReport = CreateClientRepository();