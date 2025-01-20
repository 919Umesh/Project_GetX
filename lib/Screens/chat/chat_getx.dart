import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../Models/chat_model.dart';
import 'chat_repo.dart';

class GetChatController extends GetxController {
  final isLoading = false.obs;
  RxBool seeMoreDes = false.obs;
  final messageList = <MessageModel>[].obs;

  late String senderId;
  late String receiverId;


  void initChat(String sender, String receiver) {
    senderId = sender;
    receiverId = receiver;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchMessageHistory();
  }

  Future<void> fetchMessageHistory() async {
    isLoading.value = true;
    try {
      final model = await getChatRepository.getMessages(senderId,receiverId);
      debugPrint('----------dghgfh');
      debugPrint(senderId);
      debugPrint(receiverId);

      Fluttertoast.showToast(msg: senderId);
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
