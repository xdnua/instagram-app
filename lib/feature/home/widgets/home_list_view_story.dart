import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/base/dependency/router/utils/route_input.dart';
import 'package:instagram_app/constants/edge_insets.dart';
import 'package:instagram_app/feature/home/models/story.dart';
import 'package:instagram_app/feature/home/widgets/home_story_item.dart';

class HomeListViewStory extends ConsumerWidget {
  const HomeListViewStory({super.key, required this.stories});

  final List<Story> stories;

  @override
  Widget build(BuildContext context, ref) {
    final routerService = ref.watch(AppService.router);

    return SizedBox(
      height: 105,
      child: ListView.separated(
        padding: EdgeInsetsConstants.all8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => routerService.push(RouteInput.story()),
            child: HomeStoryItem(story: stories[index]),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16);
        },
        itemCount: stories.length,
      ),
    );
  }
}
