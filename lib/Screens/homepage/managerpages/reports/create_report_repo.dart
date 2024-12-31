import 'package:dio/dio.dart';

import '../../../../base/Api_end_point/api_endpoints.dart';
import '../../../../base/Dio_services/dio_base_repository.dart';

class CreateReportRepository extends BaseRepository {
  Future<Response> postCreateUser({FormData? formData}) async {
    Response response = await postDataToServer(
      ApiEndpoint.createUser,
      formData!,
      needsAuthorization: true,
    );

    return response;
  }

  Future<Response> getUserProfile() async {
    Response response = await getDataFromServer(ApiEndpoint.getUserProfile,
        needsAuthorization: true, params: {});
    return response;
  }
}

CreateReportRepository createReportRepository = CreateReportRepository();
