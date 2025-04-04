import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelsVideoPlayer extends StatefulWidget {
  const ReelsVideoPlayer({super.key, required this.controller});

  final VideoPlayerController controller;

  @override
  State<ReelsVideoPlayer> createState() => _ReelsVideoPlayerState();
}

class _ReelsVideoPlayerState extends State<ReelsVideoPlayer> {
  bool _showOverlay = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (mounted) {
        setState(() {}); // Cập nhật UI khi video thay đổi trạng thái
      }
    });
  }

  void _togglePlayPause() {
    widget.controller.value.isPlaying
        ? widget.controller.pause()
        : widget.controller.play();
    setState(() {
      _showOverlay = !_showOverlay; // Hiện/ẩn overlay khi nhấn vào video
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Video Player
        GestureDetector(
          onTap: _togglePlayPause,
          child: Center(
            child:
                widget.controller.value.isInitialized
                    ? AspectRatio(
                      aspectRatio: widget.controller.value.aspectRatio,
                      child: VideoPlayer(widget.controller),
                    )
                    : const CircularProgressIndicator(),
          ),
        ),

        // Overlay Play/Pause Icon (hiển thị mượt hơn với AnimatedOpacity)
        AnimatedOpacity(
          opacity: _showOverlay ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: Center(
            child: ValueListenableBuilder(
              valueListenable: widget.controller,
              builder: (context, VideoPlayerValue value, _) {
                return Icon(
                  value.isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_fill,
                  color: Colors.white,
                  size: 80,
                );
              },
            ),
          ),
        ),

        // Like, Comment, Share buttons
        const Positioned(bottom: 50, right: 20, child: _ActionButtons()),

        // Mute Button
        Positioned(
          bottom: 50,
          left: 20,
          child: _MuteButton(controller: widget.controller),
        ),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.favorite, color: Colors.pink, size: 40),
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        IconButton(
          icon: const Icon(Icons.comment, color: Colors.white, size: 35),
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        IconButton(
          icon: const Icon(Icons.share, color: Colors.white, size: 35),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _MuteButton extends StatelessWidget {
  const _MuteButton({required this.controller});

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, VideoPlayerValue value, _) {
        return IconButton(
          icon: Icon(
            value.volume == 0 ? Icons.volume_off : Icons.volume_up,
            color: Colors.white,
            size: 35,
          ),
          onPressed: () => controller.setVolume(value.volume == 0 ? 1 : 0),
        );
      },
    );
  }
}
