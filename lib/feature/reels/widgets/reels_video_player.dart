import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ReelsVideoPlayer extends StatefulWidget {
  const ReelsVideoPlayer({
    super.key,
    required this.videoUrl,
    required this.caption,
    required this.userName,
    required this.isActive,
  });

  final String videoUrl;
  final String caption;
  final String userName;
  final bool isActive;

  @override
  State<ReelsVideoPlayer> createState() => _ReelsVideoPlayerState();
}

class _ReelsVideoPlayerState extends State<ReelsVideoPlayer> {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );
    await _videoController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      autoPlay: widget.isActive,
      looping: true,
      showControls: false,
      aspectRatio: _videoController.value.aspectRatio,
    );

    setState(() {
      _isInitialized = true;
    });
  }

  @override
  void didUpdateWidget(covariant ReelsVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _videoController.play();
      } else {
        _videoController.pause();
      }
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_isInitialized && _chewieController != null)
          Chewie(controller: _chewieController!)
        else
          const Center(child: CircularProgressIndicator()),

        // Caption + username
        Positioned(
          bottom: 60,
          left: 16,
          right: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '@${widget.userName}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.caption,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ),

        // Action buttons
        const Positioned(bottom: 50, right: 20, child: _ActionButtons()),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.favorite, color: Colors.pink, size: 38),
          onPressed: () {},
        ),
        const SizedBox(height: 8),
        IconButton(
          icon: const Icon(Icons.comment, color: Colors.white, size: 35),
          onPressed: () {},
        ),
        const SizedBox(height: 8),
        IconButton(
          icon: const Icon(Icons.share, color: Colors.white, size: 35),
          onPressed: () {},
        ),
      ],
    );
  }
}
