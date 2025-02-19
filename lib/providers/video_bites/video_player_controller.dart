import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProvider extends ChangeNotifier {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  VideoPlayerController get controller => _controller;
  bool get isInitialized => _isInitialized;

  VideoProvider() {
    _initializeVideo();
  }

  void _initializeVideo() {
    _controller = VideoPlayerController.network(
      'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
    )..initialize().then((_) {
        _isInitialized = true;
        _controller.play(); // Auto-play the video
        notifyListeners();
      }).catchError((error) {
        print("Video loading error: $error");
      });
  }

  void togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
