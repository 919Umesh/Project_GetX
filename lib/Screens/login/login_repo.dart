import 'package:dio/dio.dart';

import '../../base/Api_end_point/api_endpoints.dart';
import '../../base/Dio_services/dio_base_repository.dart';

class LogInRepository extends BaseRepository {
  Future<Response> signIn(FormData formData) async {
    Response response = await postDataToServer(
      ApiEndpoint.signin,
      formData,
      defaultsnackbar: true,
    );

    return response;
  }

  Future<Response> googleSignIn(token) async {
    Response response = await postDataToServer(
      ApiEndpoint.googlesign,
      FormData.fromMap({}),
      iSJsonDataHeaderType: true,
      jsonData: {"accessToken": token},
      defaultsnackbar: false,
    );

    return response;
  }

  Future<Response> getProjectCode(String projectId) async {
    Response response = await getDataFromServer(
      ApiEndpoint.getProjectDetail,
      params: {"projectid": projectId},
      defaultsnackbar: true,
    );

    return response;
  }

  Future<Response> forgotPassword(FormData formData) async {
    Response response = await postDataToServer(ApiEndpoint.signin, formData,
        defaultsnackbar: false);

    return response;
  }
}

final LogInRepository logInRepository = LogInRepository();
