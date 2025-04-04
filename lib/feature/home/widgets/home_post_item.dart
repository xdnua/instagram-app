import 'package:flutter/material.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/feature/home/models/post.dart';
import 'package:instagram_app/feature/home/widgets/home_footer_post.dart';
import 'package:instagram_app/feature/home/widgets/home_header_post.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/extensions/build_context.dart';

class HomePostItem extends StatefulWidget {
  const HomePostItem({super.key, required this.post});

  final Post post;

  @override
  State<HomePostItem> createState() => _HomePostItemState();
}

class _HomePostItemState extends State<HomePostItem>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(
      length: widget.post.images.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenSize.width;

    return Container(
      color: ColorConstants.backgroundWhite,
      width: screenWidth,
      child: Column(
        children: [
          HomeHeaderPost(post: widget.post),
          SizedBox(
            width: screenWidth,
            height: screenWidth,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return AssetGenImage(widget.post.images[index]).image();
              },
              itemCount: widget.post.images.length,
              controller: _pageViewController,
              onPageChanged: _handlePageViewChanged,
            ),
          ),
          HomeFooterPost(post: widget.post, selectedImageIndex: _currentPageIndex),
        ],
      ),
    );
  }

  void _handlePageViewChanged(int index) {
    _tabController.index = index;
    setState(() {
      _currentPageIndex = index;
    });
  }
}
