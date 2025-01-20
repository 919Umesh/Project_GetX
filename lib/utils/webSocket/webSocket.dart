import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class WebSocketService {
  IO.Socket? socket;

  void connect(String userId) {
    socket = IO.io('http://192.168.1.64:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'query': {'userId': userId},
    });

    socket?.on('connect', (_) {
      debugPrint('Connected to server as user: $userId');
      debugPrint('Connected to server');
      Fluttertoast.showToast(msg: 'Connected to server');
    });

    socket?.on('chatMessage', (data) {
      debugPrint('Message received: $data');
      Fluttertoast.showToast(msg: "$data");
    });

    socket?.on('disconnect', (_) {
      debugPrint('Disconnected from server');
      Fluttertoast.showToast(msg: 'Disconnected from server',gravity: ToastGravity.BOTTOM);
    });
  }

  void sendMessage(String senderId,String receiverId,String message) {
    if (socket != null && socket?.connected == true) {
      socket?.emit('chatMessage', {
        'senderId': senderId,
        'receiverId': receiverId,
        'message': message,
      });
      Fluttertoast.showToast(msg: "Message sent: $message");
    } else {
      Fluttertoast.showToast(msg: 'Unable to send message, not connected');
    }
  }

  void disconnect() {
    socket?.disconnect();
    Fluttertoast.showToast(msg: 'Disconnected from WebSocket');
  }
}
