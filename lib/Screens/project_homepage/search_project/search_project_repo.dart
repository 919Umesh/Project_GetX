import 'package:get_test/base/Api_end_point/api_endpoints.dart';
import 'package:get_test/base/Dio_services/dio_base_repository.dart';
import '../../../Models/homepage_project_model.dart';

class ProjectSearchRepository extends BaseRepository {
  Future<ProjectResponseModel> searchProjects(String name) async {
    final response =  await getDataFromServer(
      ApiEndpoint.projectSearchLocal,
      needsAuthorization: false,
      params: {'name':name},
    );
    return ProjectResponseModel.fromJson(response.data);
  }
}

ProjectSearchRepository projectSearchRepository = ProjectSearchRepository();



