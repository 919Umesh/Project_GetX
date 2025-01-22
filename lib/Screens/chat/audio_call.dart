import 'package:flutter/material.dart';

class AudioCallScreen extends StatelessWidget {
  final String username;
  final VoidCallback onEndCall;
  final VoidCallback onMuteToggle;
  final bool isMuted;

  const AudioCallScreen({
    super.key,
    required this.username,
    required this.onEndCall,
    required this.onMuteToggle,
    this.isMuted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  const Text(
                    "Audio Call",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blue.shade200,
                    child: Text(
                      username[0].toUpperCase(),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    username,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Calling...",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            // Call controls
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Mute button
                  InkWell(
                    onTap: onMuteToggle,
                    child: Column(
                      children: [
                        Icon(
                          isMuted ? Icons.mic_off : Icons.mic,
                          size: 40,
                          color: isMuted ? Colors.red : Colors.blue,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          isMuted ? "Unmute" : "Mute",
                          style: const TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),

                  // End call button
                  InkWell(
                    onTap: onEndCall,
                    child: const Column(
                      children: [
                        Icon(
                          Icons.call_end,
                          size: 40,
                          color: Colors.red,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "End Call",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
