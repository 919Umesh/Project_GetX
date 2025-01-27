import 'package:flutter/material.dart';

class AudioCallScreen extends StatelessWidget {
  final String username;
  final bool isMuted;
  final VoidCallback onEndCall;
  final VoidCallback onMuteToggle;

  const AudioCallScreen({
    super.key,
    required this.username,
    required this.isMuted,
    required this.onEndCall,
    required this.onMuteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Calling $username',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(isMuted ? Icons.mic_off : Icons.mic),
                  onPressed: onMuteToggle,
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.call_end),
                  onPressed: onEndCall,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}