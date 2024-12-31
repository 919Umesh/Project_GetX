import 'package:get_test/Models/order_report_model.dart';
import 'package:get_test/base/Dio_services/dio_base_repository.dart';
import 'package:get_test/base/Api_end_point/api_endpoints.dart';

class CreateClientRepository extends BaseRepository {
  Future<OrderReportModel> getOrderReport( String dbName,  String agentCode,{
    int page = 1,
    int pageSize = 10,
  }) async {
    final response = await getDataFromServer(
      ApiEndpoint.getOrderReport,
      needsAuthorization: false,
      params: {'DbName': dbName, 'BrCode': '', 'UnitCode': '', 'Module': '', 'UserCode': '', 'Glcode': '', 'Agentcode': agentCode,},
    );
    return OrderReportModel.fromJson(response.data);
  }
}
CreateClientRepository createOrderReport = CreateClientRepository();
