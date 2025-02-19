import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../providers/video_bites/video_player_controller.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _buildVideoPlayer(videoProvider),
          _buildTopBar(context),
          if (videoProvider.isInitialized) _buildBottomControls(videoProvider),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer(VideoProvider videoProvider) {
    return Center(
      child: videoProvider.isInitialized
          ? AspectRatio(
              aspectRatio: videoProvider.controller.value.aspectRatio,
              child: VideoPlayer(videoProvider.controller),
            )
          : CircularProgressIndicator(color: Colors.white),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Positioned(
      top: 40,
      left: 16,
      right: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          SizedBox(width: 10),
          Text(
            "Sai Dharam Tej",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControls(VideoProvider videoProvider) {
    return Positioned(
      bottom: 20,
      left: 16,
      right: 16,
      child: Column(
        children: [
          VideoProgressIndicator(
            videoProvider.controller,
            allowScrubbing: true,
            colors: VideoProgressColors(
              playedColor: Colors.red,
              bufferedColor: Colors.white24,
              backgroundColor: Colors.white12,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(videoProvider.controller.value.position),
                style: TextStyle(color: Colors.white),
              ),
              Text(
                _formatDuration(videoProvider.controller.value.duration),
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  videoProvider.controller.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () => videoProvider.togglePlayPause(),
              ),
              IconButton(
                icon: Icon(Icons.volume_up, color: Colors.white, size: 30),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
  }
}
