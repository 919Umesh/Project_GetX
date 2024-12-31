import 'package:get_test/Models/homepage_project_model.dart';
import 'package:get_test/base/Api_end_point/api_endpoints.dart';
import 'package:get_test/base/Dio_services/dio_base_repository.dart';

class GetProjectListRepository extends BaseRepository {
  Future<ProjectResponseModel> getProject(String status) async {
    final response =  await getDataFromServer(
      ApiEndpoint.getProjectList,
      needsAuthorization: false,
      params: {'status':status},
    );
    return ProjectResponseModel.fromJson(response.data);
  }
}

GetProjectListRepository getProjectListRepository = GetProjectListRepository();
