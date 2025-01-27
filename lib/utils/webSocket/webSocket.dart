import 'package:flutter/cupertino.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class WebSocketService {
  IO.Socket? socket;
  RTCPeerConnection? peerConnection;
  MediaStream? localStream;
  String? remoteUserId;

  void connect(String userId) {
    socket = IO.io('http://192.168.1.64:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'query': {'userId': userId},
    });

    socket?.on('connect', (_) {
      debugPrint('Connected to server as user: $userId');
      Fluttertoast.showToast(msg: 'Connected to server');
    });

    _setupWebRTCListeners();

    socket?.on('disconnect', (_) {
      debugPrint('Disconnected from server');
      Fluttertoast.showToast(msg: 'Disconnected from server');
    });
  }

  void _setupWebRTCListeners() {
    socket?.on('offer', (data) async {
      debugPrint('Offer received: $data');
      remoteUserId = data['senderId'];

      var offer = RTCSessionDescription(data['offer']['sdp'], data['offer']['type']);
      await _createPeerConnection();
      await peerConnection?.setRemoteDescription(offer);

      var answer = await peerConnection?.createAnswer();
      await peerConnection?.setLocalDescription(answer!);

      socket?.emit('answer', {
        'senderId': socket?.id,
        'receiverId': remoteUserId,
        'answer': {'sdp': answer?.sdp, 'type': answer?.type},
      });
    });

    socket?.on('answer', (data) async {
      debugPrint('Answer received: $data');
      var answer = RTCSessionDescription(data['answer']['sdp'], data['answer']['type']);
      await peerConnection?.setRemoteDescription(answer);
    });

    socket?.on('ice-candidate', (data) async {
      debugPrint('ICE candidate received: $data');
      var candidate = RTCIceCandidate(
        data['candidate']['candidate'],
        data['candidate']['sdpMid'],
        data['candidate']['sdpMLineIndex'],
      );
      await peerConnection?.addCandidate(candidate);
    });
  }


  Future<void> _createPeerConnection() async {
    if (peerConnection != null) return;

    final configuration = {
      'iceServers': [
        {'urls': 'stun:stun.l.google.com:19302'},
      ],
    };

    peerConnection = await createPeerConnection(configuration);

    localStream = await navigator.mediaDevices.getUserMedia({'audio': true});

    for (var track in localStream!.getTracks()) {
      await peerConnection?.addTrack(track, localStream!);
    }

    peerConnection?.onIceCandidate = (candidate) {
      if (candidate != null) {
        socket?.emit('ice-candidate', {
          'senderId': socket?.id,
          'receiverId': remoteUserId,
          'candidate': {
            'candidate': candidate.candidate,
            'sdpMid': candidate.sdpMid,
            'sdpMLineIndex': candidate.sdpMLineIndex,
          },
        });
      }
    };

    peerConnection?.onTrack = (RTCTrackEvent event) {
      debugPrint('Remote track added');
    };
  }


  void startCall(String senderId,String receiverId) async {
    remoteUserId = receiverId;
    await _createPeerConnection();

    var offer = await peerConnection?.createOffer();
    await peerConnection?.setLocalDescription(offer!);

    socket?.emit('offer', {
      'senderId': senderId,
      'receiverId': receiverId,
      'offer': {'sdp': offer?.sdp, 'type': offer?.type},
    });
  }


  void sendMessage(String senderId, String receiverId, String message) {
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

  void sendCallResponse(String receiverId, String senderId, String response) {
    socket?.emit('callResponse', {
      'receiverId': receiverId,
      'senderId': senderId,
      'response': response,
    });
  }
  void disconnect() {
    localStream?.dispose();
    peerConnection?.close();
    peerConnection = null;
    socket?.disconnect();
    Fluttertoast.showToast(msg: 'Disconnected from WebSocket');
  }
}

