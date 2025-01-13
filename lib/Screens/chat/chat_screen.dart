import 'package:flutter/material.dart';
import '../../utils/webSocket/webSocket.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final WebSocketService _webSocketService = WebSocketService();
  List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    _webSocketService.connect();


    _webSocketService.socket?.on('chatMessage', (data) {
      setState(() {
        _messages.add(data['message']);
      });
    });
  }

  @override
  void dispose() {
    _webSocketService.disconnect();
    super.dispose();
  }


  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      String message = _controller.text;
      _webSocketService.sendMessage(message);
      setState(() {
        _messages.add(message);
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage, // Trigger send message on press
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
