import 'package:get_test/base/Api_end_point/api_endpoints.dart';
import 'package:get_test/base/Dio_services/dio_base_repository.dart';
import '../../Models/events_model.dart';

class GetEventsRepository extends BaseRepository {
  Future<EventResponseModel> getEvents() async {
    final response =  await getDataFromServer(
      ApiEndpoint.getEvents,
      needsAuthorization: false,
      params: {},
    );
    return EventResponseModel.fromJson(response.data);
  }
}
GetEventsRepository getEventsRepository = GetEventsRepository();
