import 'package:flutter/material.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final PageController _pageController = PageController();
  final List<String> _stories = [
    "https://i.pinimg.com/736x/f8/2f/ea/f82fea696d7824d6a3e6a35bfba692b0.jpg",
    "https://i.pinimg.com/736x/0c/fb/03/0cfb0386fe47d5f19507e984761897a4.jpg",
    "https://i.pinimg.com/736x/f1/bd/89/f1bd890aaa36350d3b73fde7f0550757.jpg",
  ];
  int _currentIndex = 0;

  void _changeStory(bool isNext) {
    if (isNext) {
      if (_currentIndex < _stories.length - 1) {
        setState(() => _currentIndex++);
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        Navigator.pop(context);
      }
    } else {
      if (_currentIndex > 0) {
        setState(() => _currentIndex--);
        _pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _stories.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder:
                (context, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    _stories[index],
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
          ),
          _buildProgressBar(),
          _buildNavigationOverlay(),
          _buildStoryIndicator(),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Positioned(
      top: 8,
      left: 16,
      right: 16,
      child: Row(
        children: List.generate(_stories.length, (index) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              height: 3,
              decoration: BoxDecoration(
                color:
                    index <= _currentIndex
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildNavigationOverlay() {
    return Positioned.fill(
      child: GestureDetector(
        onTapUp: (details) {
          final width = MediaQuery.of(context).size.width;
          _changeStory(details.localPosition.dx >= width / 3);
        },
      ),
    );
  }

  Widget _buildStoryIndicator() {
    return Positioned(
      bottom: 60,
      left: 0,
      right: 0,
      child: Center(
        child: Text(
          "Story ${_currentIndex + 1} of ${_stories.length}",
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
