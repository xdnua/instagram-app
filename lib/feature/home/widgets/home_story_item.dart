import 'package:flutter/material.dart';
import 'package:instagram_app/feature/home/models/story.dart';
import 'package:instagram_app/feature/home/widgets/home_avatar_item.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class HomeStoryItem extends StatelessWidget {
  const HomeStoryItem({super.key, required this.story});

  final Story story;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAvatarItem(avatar: story.avatar, isLive: story.isLive),
        Text(story.name, style: AppTextStyle(fontSize: 12)),
      ],
    );
  }
}
