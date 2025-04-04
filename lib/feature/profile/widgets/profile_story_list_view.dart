import 'package:flutter/material.dart';
import 'package:instagram_app/feature/profile/models/profile_story.dart';
import 'package:instagram_app/feature/profile/widgets/profile_story_item.dart';

class ProfileStoryListView extends StatelessWidget {
  const ProfileStoryListView({super.key, required this.profileStories});

  final List<ProfileStory> profileStories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProfileStoryItem(profileStory: profileStories[index]);
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
        itemCount: profileStories.length,
      ),
    );
  }
}
