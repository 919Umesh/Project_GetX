
import 'package:get_test/base/Api_end_point/api_endpoints.dart';
import 'package:get_test/base/Dio_services/dio_base_repository.dart';

import '../../Models/chat_model.dart';

class GetChatRepository extends BaseRepository {
  Future<ChatResponseModel> getMessages(String sender,String receiver) async {
    final response =  await getDataFromServer(
      ApiEndpoint.getChatHistory,
      needsAuthorization: false,
      params: {
        'sender': sender, 'receiver':receiver,
      },
    );
    return ChatResponseModel.fromJson(response.data);
  }
}

GetChatRepository getChatRepository = GetChatRepository();
