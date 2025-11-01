import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/feature/reels/widgets/app_bar_reels.dart';
import 'package:instagram_app/feature/reels/widgets/reels_video_player.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final PageController _pageController = PageController();
  List<Map<String, dynamic>> _reels = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchReels();
  }

  Future<void> _fetchReels() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('reels')
            .orderBy('createdAt', descending: true)
            .get();

    setState(() {
      _reels = snapshot.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorConstants.backgroundDark,
      appBar: const AppBarReels(),
      body:
          _reels.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                itemCount: _reels.length,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final reel = _reels[index];
                  return ReelsVideoPlayer(
                    videoUrl: reel['videoUrl'],
                    caption: reel['caption'] ?? '',
                    userName: reel['uid'] ?? '',
                    isActive: index == _currentIndex,
                  );
                },
              ),
    );
  }
}
