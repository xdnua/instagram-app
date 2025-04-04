import 'package:flutter/material.dart';
import 'package:instagram_app/feature/home/data/home_data.dart';
import 'package:instagram_app/feature/home/widgets/app_bar_home.dart';
import 'package:instagram_app/feature/home/widgets/home_list_view_post.dart';
import 'package:instagram_app/feature/home/widgets/home_list_view_story.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(),
      body: Column(
        children: [
          HomeListViewStory(stories: HomeData.stories),
          Expanded(child: HomeListViewPost(posts: HomeData.posts)),
        ],
      ),
    );
  }
}
