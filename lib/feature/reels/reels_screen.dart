import 'package:flutter/material.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/feature/reels/widgets/app_bar_reels.dart';
import 'package:instagram_app/feature/reels/widgets/reels_video_player.dart';
import 'package:video_player/video_player.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final _pageController = PageController();
  final List<String> videoUrls = [
    "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
    "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
  ];

  final Map<int, VideoPlayerController> _controllers = {};

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<VideoPlayerController> _initializeController(int index) async {
    if (_controllers.containsKey(index)) {
      return _controllers[index]!;
    }

    final controller = VideoPlayerController.networkUrl(
      Uri.parse(videoUrls[index]),
    );
    await controller.initialize();
    controller.setLooping(true);

    _controllers[index] = controller;
    return controller;
  }

  void _onPageChanged(int index) {
    for (var controller in _controllers.values) {
      controller.pause();
    }

    _controllers[index]?.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorConstants.backgroundDark,
      appBar: const AppBarReels(),
      body: PageView.builder(
        controller: _pageController,
        itemCount: videoUrls.length,
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          return FutureBuilder<VideoPlayerController>(
            future: _initializeController(index),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(
                  child: Icon(Icons.error, color: Colors.white),
                );
              } else {
                return ReelsVideoPlayer(controller: snapshot.data!);
              }
            },
          );
        },
      ),
    );
  }
}
