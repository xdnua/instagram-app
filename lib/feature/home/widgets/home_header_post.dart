import 'package:flutter/material.dart';
import 'package:instagram_app/feature/home/models/post.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class HomeHeaderPost extends StatelessWidget {
  const HomeHeaderPost({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: Row(
        children: [
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: AssetGenImage(post.avatar).image(width: 32, height: 32),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    post.name,
                    style: AppTextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  if (post.isOfficial) Assets.svgs.icOfficial.svg(),
                ],
              ),
              const SizedBox(height: 2),
              Text(post.address, style: AppTextStyle(fontSize: 11)),
            ],
          ),
          const SizedBox(width: 10),
          const Spacer(),
          Assets.svgs.icMore.svg(),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
