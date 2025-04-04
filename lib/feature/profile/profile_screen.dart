import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/base/dependency/router/utils/route_input.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/constants/edge_insets.dart';
import 'package:instagram_app/feature/profile/data/profile_data.dart';
import 'package:instagram_app/feature/profile/widgets/app_bar_profile.dart';
import 'package:instagram_app/feature/profile/widgets/profile_add_story.dart';
import 'package:instagram_app/feature/profile/widgets/profile_post_grid_view.dart';
import 'package:instagram_app/feature/profile/widgets/profile_story_list_view.dart';
import 'package:instagram_app/feature/profile/widgets/profile_user_info.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/widgets/button/app_text_button.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final List<int> gridPosts = List.generate(10, (index) => index + 10);
  final List<int> tagPosts = List.generate(10, (index) => index + 100);
  late TabController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      setState(() {
        _currentIndex = _controller.index;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routerService = ref.watch(AppService.router);
    final localization = ref.watch(AppService.localization);
    final user = ProfileData.user;
    final isGrid = _currentIndex == 0;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarProfile(title: user.username),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileUserInfo(user: user),
              Padding(
                padding: EdgeInsetsConstants.all16,
                child: AppTextButton(
                  text: localization.editProfile,
                  onPressed: () {
                    routerService.push(RouteInput.editProfile());
                  },
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsetsConstants.horizontal16,
                    child: ProfileAddStory(),
                  ),
                  Expanded(
                    child: ProfileStoryListView(
                      profileStories: ProfileData.profileStories,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(color: ColorConstants.divider, height: 0.5),
              TabBar(
                controller: _controller,
                indicatorWeight: 1,
                indicatorColor: ColorConstants.backgroundDark,
                tabs: [
                  Tab(
                    icon: Assets.svgs.icGrid.svg(
                      color:
                          isGrid
                              ? ColorConstants.backgroundDark
                              : ColorConstants.textSecondary,
                    ),
                  ),
                  Tab(
                    icon: Assets.svgs.icTags.svg(
                      color:
                          !isGrid
                              ? ColorConstants.backgroundDark
                              : ColorConstants.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 1),
              if (isGrid)
                ProfilePostGridView(posts: gridPosts)
              else
                ProfilePostGridView(posts: tagPosts),
            ],
          ),
        ),
      ),
    );
  }
}
