import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../Models/chat_model.dart';
import 'chat_repo.dart';

class GetChatController extends GetxController {
  final isLoading = false.obs;
  RxBool seeMoreDes = false.obs;
  final messageList = <MessageModel>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchMessageHistory();
  }

  Future<void> fetchMessageHistory() async {
    isLoading.value = true;
    try {
      final model = await getChatRepository.getMessages('user123','user145423');
      if ( model.status == 200) {
        messageList.value = model.messages;
      } else {
        debugPrint('Error Occurred');
      }
    } catch (e) {
      debugPrint("Error fetching order report: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
