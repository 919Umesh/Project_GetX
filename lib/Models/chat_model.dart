class ChatResponseModel {
  ChatResponseModel({
    required this.status,
    required this.message,
    required this.messages,
  });

  final int status;
  final String message;
  final List<MessageModel> messages;

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    return ChatResponseModel(
      status: json["status"] ?? 0,
      message: json["message"] ?? "",
      messages: json["data"] == null
          ? []
          : List<MessageModel>.from(
          json["data"]!.map((x) => MessageModel.fromJson(x))),
    );
  }
}

class MessageModel {
  MessageModel({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.message,
    required this.timestamp,
    required this.v,
  });

  final String id;
  final String sender;
  final String receiver;
  final String message;
  final String timestamp; // Use `DateTime` if you want parsed dates
  final dynamic v;

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json["_id"] ?? "",
      sender: json["sender"] ?? "",
      receiver: json["receiver"] ?? "",
      message: json["message"] ?? "",
      timestamp: json["timestamp"] ?? "",
      v: json["__v"] ?? 0,
    );
  }
}
