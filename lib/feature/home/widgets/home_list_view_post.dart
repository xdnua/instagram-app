import 'package:flutter/material.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/feature/home/models/post.dart';
import 'package:instagram_app/feature/home/widgets/home_post_item.dart';

class HomeListViewPost extends StatelessWidget {
  const HomeListViewPost({super.key, required this.posts});

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return HomePostItem(post: posts[index]);
      },
      separatorBuilder: (context, index) {
        return const Divider(color: ColorConstants.backgroundWhite);
      },
      itemCount: posts.length,
    );
  }
}
